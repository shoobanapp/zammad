FactoryBot.define do
  factory :taskbar do
    client_id                { 123 }
    key                      { 'Ticket-1234' }
    add_attribute(:callback) { 'TicketZoom' }
    params                   { {} }
    state                    { nil }
    prio                     { 1 }
    notify                   { false }
    user_id                  { 1 }
  end
end
