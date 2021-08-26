##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'CallSummary' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.insights.v1.summary('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://insights.twilio.com/v1/Voice/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Summary',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_type": "carrier",
          "call_state": "ringing",
          "processing_state": "complete",
          "direction": "inbound",
          "disconnected_by": "callee",
          "start_time": "2015-07-30T20:00:00Z",
          "end_time": "2015-07-30T20:00:00Z",
          "duration": 100,
          "connect_duration": 99,
          "from": {},
          "to": {},
          "carrier_edge": {},
          "client_edge": {},
          "sdk_edge": {},
          "sip_edge": {},
          "tags": [
              "tags"
          ],
          "url": "https://insights.twilio.com/v1/Voice/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Summary"
      }
      ]
    ))

    actual = @client.insights.v1.summary('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end
end