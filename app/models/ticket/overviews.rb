# Copyright (C) 2012-2016 Zammad Foundation, http://zammad-foundation.org/
module Ticket::Overviews

=begin

all overviews by user

  result = Ticket::Overviews.all(current_user: User.find(3))

certain overviews by user

  result = Ticket::Overviews.all(current_user: User.find(3), links: ['all_unassigned', 'my_assigned'])

returns

  result = [overview1, overview2]

=end

  def self.all(data)
    current_user        = data[:current_user]
    overview_filter     = {}
    overview_filter_not = { out_of_office: true }

    return [] if !current_user.permissions?('ticket.customer') && !current_user.permissions?('ticket.agent')

    role_ids = User.joins(:roles).where(users: { id: current_user.id, active: true }, roles: { active: true }).pluck('roles.id')

    if data[:links].present?
      overview_filter[:link] = data[:links]
    end

    overview_filter[:active] = true
    if User.where('out_of_office = ? AND out_of_office_start_at <= ? AND out_of_office_end_at >= ? AND out_of_office_replacement_id = ? AND active = ?', true, Time.zone.today, Time.zone.today, current_user.id, true).count.positive?
      overview_filter_not = {}
    end
    if !current_user.organization_id || !current_user.organization.shared
      overview_filter[:organization_shared] = false
    end

    Overview.joins(:roles).left_joins(:users).where(overviews_roles: { role_id: role_ids }, overviews_users: { user_id: nil }, overviews: overview_filter).or(Overview.joins(:roles).left_joins(:users).where(overviews_roles: { role_id: role_ids }, overviews_users: { user_id: current_user.id }, overviews: overview_filter)).where.not(overview_filter_not).distinct('overview.id').order(:prio, :name)
  end

=begin

index of all overviews by user

  result = Ticket::Overviews.index(User.find(3))

index of certain overviews by user

  result = Ticket::Overviews.index(User.find(3), ['all_unassigned', 'my_assigned'])

returns

 [
  {
    overview: {
      id: 123,
      name: 'some name',
      view: 'some_view',
      updated_at: ...,
    },
    count: 3,
    tickets: [
      {
        id: 1,
        updated_at: ...,
      },
      {
        id: 2,
        updated_at: ...,
      },
      {
        id: 3,
        updated_at: ...,
      }
    ],
  },
  {
    ...
  }
 ]

=end

  def self.index(user, links = nil)
    overviews = Ticket::Overviews.all(
      current_user: user,
      links:        links,
    )
    return [] if overviews.blank?

    # get only tickets with permissions
    access_condition      = Ticket.access_condition(user, 'overview')
    access_condition_read = Ticket.access_condition(user, 'read')

    ticket_attributes = Ticket.new.attributes
    list = []
    overviews.each do |overview|
      query_condition, bind_condition, tables = Ticket.selector2sql(overview.condition, current_user: user)
      direction = overview.order[:direction]
      order_by = overview.order[:by]

      # validate direction
      raise "Invalid order direction '#{direction}'" if direction && direction !~ %r{^(ASC|DESC)$}i

      # check if order by exists
      if !ticket_attributes.key?(order_by)
        order_by = if ticket_attributes.key?("#{order_by}_id")
                     "#{order_by}_id"
                   else
                     'created_at'
                   end
      end
      order_by = "#{ActiveRecord::Base.connection.quote_table_name('tickets')}.#{ActiveRecord::Base.connection.quote_column_name(order_by)}"

      # check if group by exists
      if overview.group_by.present?
        group_by = overview.group_by
        if !ticket_attributes.key?(group_by)
          group_by = if ticket_attributes.key?("#{group_by}_id")
                       "#{group_by}_id"
                     end
        end
        if group_by
          order_by = "#{ActiveRecord::Base.connection.quote_table_name('tickets')}.#{ActiveRecord::Base.connection.quote_column_name(group_by)}, #{order_by}"
        end
      end

      overview_access_condition = access_condition
      if overview.condition['ticket.mention_user_ids'].present?
        overview_access_condition = access_condition_read
      end

      ticket_result = Ticket.distinct
                            .where(overview_access_condition)
                            .where(query_condition, *bind_condition)
                            .joins(tables)
                            .order(Arel.sql("#{order_by} #{direction}"))
                            .limit(2000)
                            .pluck(:id, :updated_at, Arel.sql(order_by))

      tickets = ticket_result.map do |ticket|
        {
          id:         ticket[0],
          updated_at: ticket[1],
        }
      end

      count = Ticket.distinct.where(overview_access_condition).where(query_condition, *bind_condition).joins(tables).count()
      item = {
        overview: {
          name:       overview.name,
          id:         overview.id,
          view:       overview.link,
          updated_at: overview.updated_at,
        },
        tickets:  tickets,
        count:    count,
      }

      list.push item
    end
    list
  end

end
