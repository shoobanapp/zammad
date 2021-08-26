##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Studio < Domain
      class V1 < Version
        class FlowList < ListResource
          ##
          # Initialize the FlowList
          # @param [Version] version Version that contains the resource
          # @return [FlowList] FlowList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Flows"
          end

          ##
          # Lists FlowInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams FlowInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields FlowInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of FlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of FlowInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            FlowPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of FlowInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of FlowInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            FlowPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Studio.V1.FlowList>'
          end
        end

        class FlowPage < Page
          ##
          # Initialize the FlowPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [FlowPage] FlowPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of FlowInstance
          # @param [Hash] payload Payload response from the API
          # @return [FlowInstance] FlowInstance
          def get_instance(payload)
            FlowInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Studio.V1.FlowPage>'
          end
        end

        class FlowContext < InstanceContext
          ##
          # Initialize the FlowContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies this Flow.
          # @return [FlowContext] FlowContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Flows/#{@solution[:sid]}"

            # Dependents
            @engagements = nil
            @executions = nil
          end

          ##
          # Fetch a FlowInstance
          # @return [FlowInstance] Fetched FlowInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            FlowInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the FlowInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Access the engagements
          # @return [EngagementList]
          # @return [EngagementContext] if sid was passed.
          def engagements(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return EngagementContext.new(@version, @solution[:sid], sid, )
            end

            unless @engagements
              @engagements = EngagementList.new(@version, flow_sid: @solution[:sid], )
            end

            @engagements
          end

          ##
          # Access the executions
          # @return [ExecutionList]
          # @return [ExecutionContext] if sid was passed.
          def executions(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ExecutionContext.new(@version, @solution[:sid], sid, )
            end

            unless @executions
              @executions = ExecutionList.new(@version, flow_sid: @solution[:sid], )
            end

            @executions
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Studio.V1.FlowContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Studio.V1.FlowContext #{context}>"
          end
        end

        class FlowInstance < InstanceResource
          ##
          # Initialize the FlowInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies this Flow.
          # @return [FlowInstance] FlowInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'status' => payload['status'],
                'version' => payload['version'].to_i,
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [FlowContext] FlowContext for this FlowInstance
          def context
            unless @instance_context
              @instance_context = FlowContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A string that uniquely identifies this Flow.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] Account Sid.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] A human readable description of this resource.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [flow.Status] The Status of this Flow
          def status
            @properties['status']
          end

          ##
          # @return [String] The latest version number of this Flow's definition.
          def version
            @properties['version']
          end

          ##
          # @return [Time] The date this Flow was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Flow was updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The URL of this resource.
          def url
            @properties['url']
          end

          ##
          # @return [String] Nested resource URLs.
          def links
            @properties['links']
          end

          ##
          # Fetch a FlowInstance
          # @return [FlowInstance] Fetched FlowInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the FlowInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Access the engagements
          # @return [engagements] engagements
          def engagements
            context.engagements
          end

          ##
          # Access the executions
          # @return [executions] executions
          def executions
            context.executions
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Studio.V1.FlowInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Studio.V1.FlowInstance #{values}>"
          end
        end
      end
    end
  end
end