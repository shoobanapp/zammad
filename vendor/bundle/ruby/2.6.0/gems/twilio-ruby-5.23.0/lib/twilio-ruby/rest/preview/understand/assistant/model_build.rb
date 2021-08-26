##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class AssistantContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ModelBuildList < ListResource
            ##
            # Initialize the ModelBuildList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The unique ID of the parent Assistant.
            # @return [ModelBuildList] ModelBuildList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
              @uri = "/Assistants/#{@solution[:assistant_sid]}/ModelBuilds"
            end

            ##
            # Lists ModelBuildInstance records from the API as a list.
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
            # Streams ModelBuildInstance records from the API as an Enumerable.
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
            # When passed a block, yields ModelBuildInstance records from the API.
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
            # Retrieve a single page of ModelBuildInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ModelBuildInstance
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
              ModelBuildPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ModelBuildInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ModelBuildInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ModelBuildPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ModelBuildInstance records from the API.
            # Request is executed immediately.
            # @param [String] status_callback The status_callback
            # @param [String] unique_name A user-provided string that uniquely identifies this
            #   resource as an alternative to the sid. Unique up to 64 characters long. For
            #   example: v0.1
            # @return [ModelBuildInstance] Newly created ModelBuildInstance
            def create(status_callback: :unset, unique_name: :unset)
              data = Twilio::Values.of({'StatusCallback' => status_callback, 'UniqueName' => unique_name, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ModelBuildInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.ModelBuildList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ModelBuildPage < Page
            ##
            # Initialize the ModelBuildPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ModelBuildPage] ModelBuildPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ModelBuildInstance
            # @param [Hash] payload Payload response from the API
            # @return [ModelBuildInstance] ModelBuildInstance
            def get_instance(payload)
              ModelBuildInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.ModelBuildPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ModelBuildContext < InstanceContext
            ##
            # Initialize the ModelBuildContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The assistant_sid
            # @param [String] sid The sid
            # @return [ModelBuildContext] ModelBuildContext
            def initialize(version, assistant_sid, sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, sid: sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/ModelBuilds/#{@solution[:sid]}"
            end

            ##
            # Fetch a ModelBuildInstance
            # @return [ModelBuildInstance] Fetched ModelBuildInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ModelBuildInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the ModelBuildInstance
            # @param [String] unique_name A user-provided string that uniquely identifies this
            #   resource as an alternative to the sid. Unique up to 64 characters long. For
            #   example: v0.1
            # @return [ModelBuildInstance] Updated ModelBuildInstance
            def update(unique_name: :unset)
              data = Twilio::Values.of({'UniqueName' => unique_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ModelBuildInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the ModelBuildInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.ModelBuildContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.ModelBuildContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ModelBuildInstance < InstanceResource
            ##
            # Initialize the ModelBuildInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The unique ID of the parent Assistant.
            # @param [String] sid The sid
            # @return [ModelBuildInstance] ModelBuildInstance
            def initialize(version, payload, assistant_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'assistant_sid' => payload['assistant_sid'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'unique_name' => payload['unique_name'],
                  'url' => payload['url'],
                  'build_duration' => payload['build_duration'] == nil ? payload['build_duration'] : payload['build_duration'].to_i,
                  'error_code' => payload['error_code'] == nil ? payload['error_code'] : payload['error_code'].to_i,
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ModelBuildContext] ModelBuildContext for this ModelBuildInstance
            def context
              unless @instance_context
                @instance_context = ModelBuildContext.new(@version, @params['assistant_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account that created this Model Build.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date that this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The unique ID of the parent Assistant.
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [model_build.Status] A string that described the model build status. The values can be: enqueued, building, completed, failed
            def status
              @properties['status']
            end

            ##
            # @return [String] A user-provided string that uniquely identifies this resource as an alternative to the sid. Unique up to 64 characters long.
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The time in seconds it took to build the model.
            def build_duration
              @properties['build_duration']
            end

            ##
            # @return [String] The error_code
            def error_code
              @properties['error_code']
            end

            ##
            # Fetch a ModelBuildInstance
            # @return [ModelBuildInstance] Fetched ModelBuildInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ModelBuildInstance
            # @param [String] unique_name A user-provided string that uniquely identifies this
            #   resource as an alternative to the sid. Unique up to 64 characters long. For
            #   example: v0.1
            # @return [ModelBuildInstance] Updated ModelBuildInstance
            def update(unique_name: :unset)
              context.update(unique_name: unique_name, )
            end

            ##
            # Deletes the ModelBuildInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.ModelBuildInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.ModelBuildInstance #{values}>"
            end
          end
        end
      end
    end
  end
end