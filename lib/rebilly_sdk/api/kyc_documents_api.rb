=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

module RebillySdk
  class KYCDocumentsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete the KYC request
    # Delete the KYC request with the predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_kyc_request(id, opts = {})
      delete_kyc_request_with_http_info(id, opts)
      nil
    end

    # Delete the KYC request
    # Delete the KYC request with the predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_kyc_request_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.delete_kyc_request ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.delete_kyc_request"
      end
      # resource path
      local_var_path = '/kyc-requests/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: KYCDocumentsApi#delete_kyc_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a KYC Document
    # Retrieve a KYC document with specified identifier string.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def get_kyc_document(id, opts = {})
      data, _status_code, _headers = get_kyc_document_with_http_info(id, opts)
      data
    end

    # Retrieve a KYC Document
    # Retrieve a KYC document with specified identifier string.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def get_kyc_document_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.get_kyc_document ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.get_kyc_document"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#get_kyc_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of KYC documents
    # Retrieve a list of KYC documents. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @return [Array<KycDocument2>]
    def get_kyc_document_collection(opts = {})
      data, _status_code, _headers = get_kyc_document_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of KYC documents
    # Retrieve a list of KYC documents. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @return [Array<(Array<KycDocument2>, Integer, Hash)>] Array<KycDocument2> data, response status code and response headers
    def get_kyc_document_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.get_kyc_document_collection ...'
      end
      # resource path
      local_var_path = '/kyc-documents'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = @api_client.build_collection_param(opts[:'sort'], :csv) if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<KycDocument2>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#get_kyc_document_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a KYC request
    # Retrieve a KYC request with specified identifier string.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycRequest]
    def get_kyc_request(id, opts = {})
      data, _status_code, _headers = get_kyc_request_with_http_info(id, opts)
      data
    end

    # Retrieve a KYC request
    # Retrieve a KYC request with specified identifier string.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycRequest, Integer, Hash)>] KycRequest data, response status code and response headers
    def get_kyc_request_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.get_kyc_request ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.get_kyc_request"
      end
      # resource path
      local_var_path = '/kyc-requests/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycRequest' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#get_kyc_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of KYC requests
    # Retrieve a list of KYC requests. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @return [Array<KycRequest>]
    def get_kyc_request_collection(opts = {})
      data, _status_code, _headers = get_kyc_request_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of KYC requests
    # Retrieve a list of KYC requests. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @return [Array<(Array<KycRequest>, Integer, Hash)>] Array<KycRequest> data, response status code and response headers
    def get_kyc_request_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.get_kyc_request_collection ...'
      end
      # resource path
      local_var_path = '/kyc-requests'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = @api_client.build_collection_param(opts[:'sort'], :csv) if !opts[:'sort'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<KycRequest>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#get_kyc_request_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update a KYC request
    # Update a KYC request.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [] :body 
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycRequest]
    def patch_kyc_request(id, opts = {})
      data, _status_code, _headers = patch_kyc_request_with_http_info(id, opts)
      data
    end

    # Update a KYC request
    # Update a KYC request.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [] :body 
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycRequest, Integer, Hash)>] KycRequest data, response status code and response headers
    def patch_kyc_request_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.patch_kyc_request ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.patch_kyc_request"
      end
      # resource path
      local_var_path = '/kyc-requests/{id}'.sub('{' + 'id' + '}', id.to_s)

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
      post_body = opts[:body] || @api_client.object_to_http_body(opts[:'body']) 

      return_type = opts[:return_type] || 'KycRequest' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#patch_kyc_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a KYC Document
    # Create a KYC Document. 
    # @param body Kyc document resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document(body, opts = {})
      data, _status_code, _headers = post_kyc_document_with_http_info(body, opts)
      data
    end

    # Create a KYC Document
    # Create a KYC Document. 
    # @param body Kyc document resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling KYCDocumentsApi.post_kyc_document"
      end
      # resource path
      local_var_path = '/kyc-documents'

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Accept a KYC document
    # Marks that status of the document as `accepted`. Updates the review time and reviewer information. Intended to be used for manual overrides. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document_acceptance(id, opts = {})
      data, _status_code, _headers = post_kyc_document_acceptance_with_http_info(id, opts)
      data
    end

    # Accept a KYC document
    # Marks that status of the document as &#x60;accepted&#x60;. Updates the review time and reviewer information. Intended to be used for manual overrides. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_acceptance_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_acceptance ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_acceptance"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/acceptance'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_acceptance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update a KYC document's documentMatches
    # Updates a KYC document's documentMatches. Intended to be used for manual overrides. 
    # @param body Kyc document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def post_kyc_document_matches(body, id, opts = {})
      post_kyc_document_matches_with_http_info(body, id, opts)
      nil
    end

    # Update a KYC document&#x27;s documentMatches
    # Updates a KYC document&#x27;s documentMatches. Intended to be used for manual overrides. 
    # @param body Kyc document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def post_kyc_document_matches_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_matches ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling KYCDocumentsApi.post_kyc_document_matches"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_matches"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/matches'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_matches\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Reject a KYC document
    # Marks that status of the document as `rejected`. Updates the review time and reviewer information. Intended to be used for manual overrides. 
    # @param body KYC document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document_rejection(body, id, opts = {})
      data, _status_code, _headers = post_kyc_document_rejection_with_http_info(body, id, opts)
      data
    end

    # Reject a KYC document
    # Marks that status of the document as &#x60;rejected&#x60;. Updates the review time and reviewer information. Intended to be used for manual overrides. 
    # @param body KYC document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_rejection_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_rejection ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling KYCDocumentsApi.post_kyc_document_rejection"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_rejection"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/rejection'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_rejection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Review a KYC document
    # Mark the KYC document as reviewed. Updates the review time and reviewer. information.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document_review(id, opts = {})
      data, _status_code, _headers = post_kyc_document_review_with_http_info(id, opts)
      data
    end

    # Review a KYC document
    # Mark the KYC document as reviewed. Updates the review time and reviewer. information.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_review_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_review ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_review"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/review'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_review\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Start review for a KYC document
    # Sets the KYC document `reviewStartTime` to the current date-time, along with the review information.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document_start_review(id, opts = {})
      data, _status_code, _headers = post_kyc_document_start_review_with_http_info(id, opts)
      data
    end

    # Start review for a KYC document
    # Sets the KYC document &#x60;reviewStartTime&#x60; to the current date-time, along with the review information.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_start_review_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_start_review ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_start_review"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/start-review'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_start_review\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Stop review for a KYC document
    # Sets the KYC document `reviewStartTime` to null, along with the reviewer information to null too. Use this when the reviewer decides to stop, take a break, or ends a shift.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def post_kyc_document_stop_review(id, opts = {})
      data, _status_code, _headers = post_kyc_document_stop_review_with_http_info(id, opts)
      data
    end

    # Stop review for a KYC document
    # Sets the KYC document &#x60;reviewStartTime&#x60; to null, along with the reviewer information to null too. Use this when the reviewer decides to stop, take a break, or ends a shift.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def post_kyc_document_stop_review_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_document_stop_review ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.post_kyc_document_stop_review"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}/stop-review'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_document_stop_review\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a KYC Request
    # Create a KYC Request. 
    # @param body Kyc request resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycRequest]
    def post_kyc_request(body, opts = {})
      data, _status_code, _headers = post_kyc_request_with_http_info(body, opts)
      data
    end

    # Create a KYC Request
    # Create a KYC Request. 
    # @param body Kyc request resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycRequest, Integer, Hash)>] KycRequest data, response status code and response headers
    def post_kyc_request_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.post_kyc_request ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling KYCDocumentsApi.post_kyc_request"
      end
      # resource path
      local_var_path = '/kyc-requests'

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

      return_type = opts[:return_type] || 'KycRequest' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#post_kyc_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a KYC document with predefined ID
    # Create or update a KYC document with predefined identifier string.
    # @param body KYC document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [KycDocument2]
    def put_kyc_document(body, id, opts = {})
      data, _status_code, _headers = put_kyc_document_with_http_info(body, id, opts)
      data
    end

    # Create or update a KYC document with predefined ID
    # Create or update a KYC document with predefined identifier string.
    # @param body KYC document resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(KycDocument2, Integer, Hash)>] KycDocument2 data, response status code and response headers
    def put_kyc_document_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KYCDocumentsApi.put_kyc_document ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling KYCDocumentsApi.put_kyc_document"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling KYCDocumentsApi.put_kyc_document"
      end
      # resource path
      local_var_path = '/kyc-documents/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'KycDocument2' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KYCDocumentsApi#put_kyc_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
