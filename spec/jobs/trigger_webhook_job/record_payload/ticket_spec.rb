require 'rails_helper'
require 'jobs/trigger_webhook_job/record_payload/base_example'

RSpec.describe TriggerWebhookJob::RecordPayload::Ticket do
  it_behaves_like 'TriggerWebhookJob::RecordPayload backend', :ticket
end
