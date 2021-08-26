##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EnvironmentList < ListResource
            ##
            # Initialize the EnvironmentList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Environment.
            # @return [EnvironmentList] EnvironmentList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Environments"
            end

            ##
            # Lists EnvironmentInstance records from the API as a list.
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
            # Streams EnvironmentInstance records from the API as an Enumerable.
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
            # When passed a block, yields EnvironmentInstance records from the API.
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
            # Retrieve a single page of EnvironmentInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of EnvironmentInstance
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
              EnvironmentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of EnvironmentInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of EnvironmentInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              EnvironmentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of EnvironmentInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name A unique, addressable name of this Environment,
            #   fewer than 256 characters. Required.
            # @param [String] domain_suffix A URL-friendly name that represents this
            #   Environment and forms part of the domain name, fewer than 32 characters.
            #   Required.
            # @return [EnvironmentInstance] Newly created EnvironmentInstance
            def create(unique_name: nil, domain_suffix: :unset)
              data = Twilio::Values.of({'UniqueName' => unique_name, 'DomainSuffix' => domain_suffix, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              EnvironmentInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Serverless.V1.EnvironmentList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EnvironmentPage < Page
            ##
            # Initialize the EnvironmentPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [EnvironmentPage] EnvironmentPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of EnvironmentInstance
            # @param [Hash] payload Payload response from the API
            # @return [EnvironmentInstance] EnvironmentInstance
            def get_instance(payload)
              EnvironmentInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Serverless.V1.EnvironmentPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EnvironmentContext < InstanceContext
            ##
            # Initialize the EnvironmentContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Environment.
            # @param [String] sid The unique SID identifier of this Environment.
            # @return [EnvironmentContext] EnvironmentContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:sid]}"

              # Dependents
              @variables = nil
              @deployments = nil
            end

            ##
            # Fetch a EnvironmentInstance
            # @return [EnvironmentInstance] Fetched EnvironmentInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              EnvironmentInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Access the variables
            # @return [VariableList]
            # @return [VariableContext] if sid was passed.
            def variables(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return VariableContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @variables
                @variables = VariableList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:sid],
                )
              end

              @variables
            end

            ##
            # Access the deployments
            # @return [DeploymentList]
            # @return [DeploymentContext] if sid was passed.
            def deployments(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return DeploymentContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @deployments
                @deployments = DeploymentList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:sid],
                )
              end

              @deployments
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.EnvironmentContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.EnvironmentContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EnvironmentInstance < InstanceResource
            ##
            # Initialize the EnvironmentInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Environment.
            # @param [String] sid The unique SID identifier of this Environment.
            # @return [EnvironmentInstance] EnvironmentInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'build_sid' => payload['build_sid'],
                  'unique_name' => payload['unique_name'],
                  'domain_suffix' => payload['domain_suffix'],
                  'domain_name' => payload['domain_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [EnvironmentContext] EnvironmentContext for this EnvironmentInstance
            def context
              unless @instance_context
                @instance_context = EnvironmentContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] Environment Sid.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] Build Sid.
            def build_sid
              @properties['build_sid']
            end

            ##
            # @return [String] A unique, addressable name of this Environment.
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] A URL-friendly name that represents this Environment.
            def domain_suffix
              @properties['domain_suffix']
            end

            ##
            # @return [String] The base domain name for all Functions and Assets deployed in this Environment.
            def domain_name
              @properties['domain_name']
            end

            ##
            # @return [Time] The date that this Environment was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this Environment was updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URL of this Environment.
            def url
              @properties['url']
            end

            ##
            # @return [String] Nested resource URLs.
            def links
              @properties['links']
            end

            ##
            # Fetch a EnvironmentInstance
            # @return [EnvironmentInstance] Fetched EnvironmentInstance
            def fetch
              context.fetch
            end

            ##
            # Access the variables
            # @return [variables] variables
            def variables
              context.variables
            end

            ##
            # Access the deployments
            # @return [deployments] deployments
            def deployments
              context.deployments
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.EnvironmentInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.EnvironmentInstance #{values}>"
            end
          end
        end
      end
    end
  end
end