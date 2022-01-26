=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

module RebillySdk
  class CustomersTimelineApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete a Customer Timeline message
    # Delete a Customer Timeline message with predefined identifier string. 
    # @param id The resource identifier string.
    # @param message_id The Customer Timeline message ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_customer_timeline(id, message_id, opts = {})
      delete_customer_timeline_with_http_info(id, message_id, opts)
      nil
    end

    # Delete a Customer Timeline message
    # Delete a Customer Timeline message with predefined identifier string. 
    # @param id The resource identifier string.
    # @param message_id The Customer Timeline message ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_customer_timeline_with_http_info(id, message_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.delete_customer_timeline ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomersTimelineApi.delete_customer_timeline"
      end
      # verify the required parameter 'message_id' is set
      if @api_client.config.client_side_validation && message_id.nil?
        fail ArgumentError, "Missing the required parameter 'message_id' when calling CustomersTimelineApi.delete_customer_timeline"
      end
      # resource path
      local_var_path = '/customers/{id}/timeline/{messageId}'.sub('{' + 'id' + '}', id.to_s).sub('{' + 'messageId' + '}', message_id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#delete_customer_timeline\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a customer Timeline message
    # Retrieve a customer message with specified identifier string. 
    # @param id The resource identifier string.
    # @param message_id The Customer Timeline message ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [CustomerTimeline]
    def get_customer_timeline(id, message_id, opts = {})
      data, _status_code, _headers = get_customer_timeline_with_http_info(id, message_id, opts)
      data
    end

    # Retrieve a customer Timeline message
    # Retrieve a customer message with specified identifier string. 
    # @param id The resource identifier string.
    # @param message_id The Customer Timeline message ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(CustomerTimeline, Integer, Hash)>] CustomerTimeline data, response status code and response headers
    def get_customer_timeline_with_http_info(id, message_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.get_customer_timeline ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomersTimelineApi.get_customer_timeline"
      end
      # verify the required parameter 'message_id' is set
      if @api_client.config.client_side_validation && message_id.nil?
        fail ArgumentError, "Missing the required parameter 'message_id' when calling CustomersTimelineApi.get_customer_timeline"
      end
      # resource path
      local_var_path = '/customers/{id}/timeline/{messageId}'.sub('{' + 'id' + '}', id.to_s).sub('{' + 'messageId' + '}', message_id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'CustomerTimeline' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#get_customer_timeline\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of customer timeline messages
    # Retrieve a list of customer timeline messages. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @option opts [String] :q The partial search of the text fields.
    # @return [Array<CustomerTimeline>]
    def get_customer_timeline_collection(id, opts = {})
      data, _status_code, _headers = get_customer_timeline_collection_with_http_info(id, opts)
      data
    end

    # Retrieve a list of customer timeline messages
    # Retrieve a list of customer timeline messages. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @option opts [String] :q The partial search of the text fields.
    # @return [Array<(Array<CustomerTimeline>, Integer, Hash)>] Array<CustomerTimeline> data, response status code and response headers
    def get_customer_timeline_collection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.get_customer_timeline_collection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomersTimelineApi.get_customer_timeline_collection"
      end
      # resource path
      local_var_path = '/customers/{id}/timeline'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = @api_client.build_collection_param(opts[:'sort'], :csv) if !opts[:'sort'].nil?
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<CustomerTimeline>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#get_customer_timeline_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve customer timeline custom event type with specified identifier string
    # Retrieve customer timeline custom event type. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [CustomerTimelineCustomEvent]
    def get_customer_timeline_custom_event_type(id, opts = {})
      data, _status_code, _headers = get_customer_timeline_custom_event_type_with_http_info(id, opts)
      data
    end

    # Retrieve customer timeline custom event type with specified identifier string
    # Retrieve customer timeline custom event type. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(CustomerTimelineCustomEvent, Integer, Hash)>] CustomerTimelineCustomEvent data, response status code and response headers
    def get_customer_timeline_custom_event_type_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.get_customer_timeline_custom_event_type ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomersTimelineApi.get_customer_timeline_custom_event_type"
      end
      # resource path
      local_var_path = '/customer-timeline-custom-events/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'CustomerTimelineCustomEvent' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#get_customer_timeline_custom_event_type\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of customer timeline custom event types
    # Retrieve a list of customer timeline custom event types. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @return [Array<CustomerTimelineCustomEvent>]
    def get_customer_timeline_custom_event_type_collection(opts = {})
      data, _status_code, _headers = get_customer_timeline_custom_event_type_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of customer timeline custom event types
    # Retrieve a list of customer timeline custom event types. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @return [Array<(Array<CustomerTimelineCustomEvent>, Integer, Hash)>] Array<CustomerTimelineCustomEvent> data, response status code and response headers
    def get_customer_timeline_custom_event_type_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.get_customer_timeline_custom_event_type_collection ...'
      end
      # resource path
      local_var_path = '/customer-timeline-custom-events'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<CustomerTimelineCustomEvent>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#get_customer_timeline_custom_event_type_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of customer timeline messages for all customers
    # Retrieve a list of customer timeline messages for all customers. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @return [Array<CustomerTimeline>]
    def get_customer_timeline_event_collection(opts = {})
      data, _status_code, _headers = get_customer_timeline_event_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of customer timeline messages for all customers
    # Retrieve a list of customer timeline messages for all customers. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @return [Array<(Array<CustomerTimeline>, Integer, Hash)>] Array<CustomerTimeline> data, response status code and response headers
    def get_customer_timeline_event_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.get_customer_timeline_event_collection ...'
      end
      # resource path
      local_var_path = '/customer-timeline-events'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<CustomerTimeline>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#get_customer_timeline_event_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a customer Timeline comment or custom defined event
    # Create a customer Timeline comment or custom defined event. 
    # @param body Customer Timeline resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [CustomerTimeline]
    def post_customer_timeline(body, id, opts = {})
      data, _status_code, _headers = post_customer_timeline_with_http_info(body, id, opts)
      data
    end

    # Create a customer Timeline comment or custom defined event
    # Create a customer Timeline comment or custom defined event. 
    # @param body Customer Timeline resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(CustomerTimeline, Integer, Hash)>] CustomerTimeline data, response status code and response headers
    def post_customer_timeline_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.post_customer_timeline ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomersTimelineApi.post_customer_timeline"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomersTimelineApi.post_customer_timeline"
      end
      # resource path
      local_var_path = '/customers/{id}/timeline'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(body) 

      return_type = opts[:return_type] || 'CustomerTimeline' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#post_customer_timeline\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create Customer Timeline custom event type
    # Create Customer Timeline custom event type. 
    # @param body Customer Timeline Custom Event Type resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [CustomerTimelineCustomEvent]
    def post_customer_timeline_custom_event_type(body, opts = {})
      data, _status_code, _headers = post_customer_timeline_custom_event_type_with_http_info(body, opts)
      data
    end

    # Create Customer Timeline custom event type
    # Create Customer Timeline custom event type. 
    # @param body Customer Timeline Custom Event Type resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(CustomerTimelineCustomEvent, Integer, Hash)>] CustomerTimelineCustomEvent data, response status code and response headers
    def post_customer_timeline_custom_event_type_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomersTimelineApi.post_customer_timeline_custom_event_type ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomersTimelineApi.post_customer_timeline_custom_event_type"
      end
      # resource path
      local_var_path = '/customer-timeline-custom-events'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(body) 

      return_type = opts[:return_type] || 'CustomerTimelineCustomEvent' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomersTimelineApi#post_customer_timeline_custom_event_type\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
