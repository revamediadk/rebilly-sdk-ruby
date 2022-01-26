=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

module RebillySdk
  class InvoicesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete an invoice item
    # Delete an invoice item. 
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_invoice_item(id, item_id, opts = {})
      delete_invoice_item_with_http_info(id, item_id, opts)
      nil
    end

    # Delete an invoice item
    # Delete an invoice item. 
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_invoice_item_with_http_info(id, item_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.delete_invoice_item ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.delete_invoice_item"
      end
      # verify the required parameter 'item_id' is set
      if @api_client.config.client_side_validation && item_id.nil?
        fail ArgumentError, "Missing the required parameter 'item_id' when calling InvoicesApi.delete_invoice_item"
      end
      # resource path
      local_var_path = '/invoices/{id}/items/{itemId}'.sub('{' + 'id' + '}', id.to_s).sub('{' + 'itemId' + '}', item_id.to_s)

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
        @api_client.config.logger.debug "API called: InvoicesApi#delete_invoice_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve customer's upcoming invoices
    # Retrieve a list of upcoming invoices from the subscriptions which belong to. the given customer. The endpoint is temporary before upcoming invoices get a complete integration. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<Invoice>]
    def get_customer_upcoming_invoice_collection(id, opts = {})
      data, _status_code, _headers = get_customer_upcoming_invoice_collection_with_http_info(id, opts)
      data
    end

    # Retrieve customer&#x27;s upcoming invoices
    # Retrieve a list of upcoming invoices from the subscriptions which belong to. the given customer. The endpoint is temporary before upcoming invoices get a complete integration. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<(Array<Invoice>, Integer, Hash)>] Array<Invoice> data, response status code and response headers
    def get_customer_upcoming_invoice_collection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_customer_upcoming_invoice_collection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_customer_upcoming_invoice_collection"
      end
      # resource path
      local_var_path = '/customers/{id}/upcoming-invoices'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'expand'] = opts[:'expand'] if !opts[:'expand'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<Invoice>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_customer_upcoming_invoice_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve an invoice
    # Retrieve an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :accept The response media type. (default to application/json)
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Invoice]
    def get_invoice(id, opts = {})
      data, _status_code, _headers = get_invoice_with_http_info(id, opts)
      data
    end

    # Retrieve an invoice
    # Retrieve an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :accept The response media type.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def get_invoice_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice"
      end
      if @api_client.config.client_side_validation && opts[:'accept'] && !['application/json', 'application/pdf'].include?(opts[:'accept'])
        fail ArgumentError, 'invalid value for "accept", must be one of application/json, application/pdf'
      end
      # resource path
      local_var_path = '/invoices/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'expand'] = opts[:'expand'] if !opts[:'expand'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/pdf'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?
      header_params[:'Accept'] = opts[:'accept'] if !opts[:'accept'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['ApplicationJWT', 'JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of invoices
    # Retrieve a list of invoices. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :q The partial search of the text fields.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<Invoice>]
    def get_invoice_collection(opts = {})
      data, _status_code, _headers = get_invoice_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of invoices
    # Retrieve a list of invoices. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
    # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :q The partial search of the text fields.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<(Array<Invoice>, Integer, Hash)>] Array<Invoice> data, response status code and response headers
    def get_invoice_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice_collection ...'
      end
      # resource path
      local_var_path = '/invoices'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'sort'] = @api_client.build_collection_param(opts[:'sort'], :csv) if !opts[:'sort'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
      query_params[:'expand'] = opts[:'expand'] if !opts[:'expand'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<Invoice>' 

      auth_names = opts[:auth_names] || ['ApplicationJWT', 'JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get an invoice item
    # Get an invoice item. 
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [InvoiceItem]
    def get_invoice_item(id, item_id, opts = {})
      data, _status_code, _headers = get_invoice_item_with_http_info(id, item_id, opts)
      data
    end

    # Get an invoice item
    # Get an invoice item. 
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(InvoiceItem, Integer, Hash)>] InvoiceItem data, response status code and response headers
    def get_invoice_item_with_http_info(id, item_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice_item ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice_item"
      end
      # verify the required parameter 'item_id' is set
      if @api_client.config.client_side_validation && item_id.nil?
        fail ArgumentError, "Missing the required parameter 'item_id' when calling InvoicesApi.get_invoice_item"
      end
      # resource path
      local_var_path = '/invoices/{id}/items/{itemId}'.sub('{' + 'id' + '}', id.to_s).sub('{' + 'itemId' + '}', item_id.to_s)

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

      return_type = opts[:return_type] || 'InvoiceItem' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve invoice items
    # Retrieve an invoice items with specified invoice identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<InvoiceItem>]
    def get_invoice_item_collection(id, opts = {})
      data, _status_code, _headers = get_invoice_item_collection_with_http_info(id, opts)
      data
    end

    # Retrieve invoice items
    # Retrieve an invoice items with specified invoice identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
    # @return [Array<(Array<InvoiceItem>, Integer, Hash)>] Array<InvoiceItem> data, response status code and response headers
    def get_invoice_item_collection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice_item_collection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice_item_collection"
      end
      # resource path
      local_var_path = '/invoices/{id}/items'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'expand'] = opts[:'expand'] if !opts[:'expand'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<InvoiceItem>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice_item_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get transaction amounts allocated to an invoice
    # Get the precise amounts from a transaction allocated as invoice payments.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<InvoiceTransactionAllocation>]
    def get_invoice_transaction_allocation_collection(id, opts = {})
      data, _status_code, _headers = get_invoice_transaction_allocation_collection_with_http_info(id, opts)
      data
    end

    # Get transaction amounts allocated to an invoice
    # Get the precise amounts from a transaction allocated as invoice payments.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<(Array<InvoiceTransactionAllocation>, Integer, Hash)>] Array<InvoiceTransactionAllocation> data, response status code and response headers
    def get_invoice_transaction_allocation_collection_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice_transaction_allocation_collection ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice_transaction_allocation_collection"
      end
      # resource path
      local_var_path = '/invoices/{id}/transaction-allocations'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Organization-Id'] = opts[:'organization_id'] if !opts[:'organization_id'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      return_type = opts[:return_type] || 'Array<InvoiceTransactionAllocation>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice_transaction_allocation_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create an invoice
    # Create an invoice. 
    # @param body Invoice resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice(body, opts = {})
      data, _status_code, _headers = post_invoice_with_http_info(body, opts)
      data
    end

    # Create an invoice
    # Create an invoice. 
    # @param body Invoice resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.post_invoice"
      end
      # resource path
      local_var_path = '/invoices'

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Abandon an invoice
    # Abandon an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_abandonment(id, opts = {})
      data, _status_code, _headers = post_invoice_abandonment_with_http_info(id, opts)
      data
    end

    # Abandon an invoice
    # Abandon an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_abandonment_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_abandonment ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_abandonment"
      end
      # resource path
      local_var_path = '/invoices/{id}/abandon'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_abandonment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Issue an invoice
    # Issue an invoice with specified identifier string. It must be in `draft` status. 
    # @param body InvoiceIssue resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_issuance(body, id, opts = {})
      data, _status_code, _headers = post_invoice_issuance_with_http_info(body, id, opts)
      data
    end

    # Issue an invoice
    # Issue an invoice with specified identifier string. It must be in &#x60;draft&#x60; status. 
    # @param body InvoiceIssue resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_issuance_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_issuance ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.post_invoice_issuance"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_issuance"
      end
      # resource path
      local_var_path = '/invoices/{id}/issue'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_issuance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create an invoice item
    # Create an invoice item. 
    # @param body InvoiceItem resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [InvoiceItem]
    def post_invoice_item(body, id, opts = {})
      data, _status_code, _headers = post_invoice_item_with_http_info(body, id, opts)
      data
    end

    # Create an invoice item
    # Create an invoice item. 
    # @param body InvoiceItem resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(InvoiceItem, Integer, Hash)>] InvoiceItem data, response status code and response headers
    def post_invoice_item_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_item ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.post_invoice_item"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_item"
      end
      # resource path
      local_var_path = '/invoices/{id}/items'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'InvoiceItem' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Recalculate an invoice
    # Recalculate an invoice with specified identifier string. It will recalculate shipping rates, taxes, discounts. It is useful when coupon was revoked or customer redeemed coupon after invoice was issued and you want to apply it to this invoice. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_recalculation(id, opts = {})
      data, _status_code, _headers = post_invoice_recalculation_with_http_info(id, opts)
      data
    end

    # Recalculate an invoice
    # Recalculate an invoice with specified identifier string. It will recalculate shipping rates, taxes, discounts. It is useful when coupon was revoked or customer redeemed coupon after invoice was issued and you want to apply it to this invoice. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_recalculation_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_recalculation ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_recalculation"
      end
      # resource path
      local_var_path = '/invoices/{id}/recalculate'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_recalculation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Reissue an invoice
    # Reissue an invoice with specified identifier string. It must be issued. (status must be `unpaid` or `past-due`). 
    # @param body InvoiceReissue resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_reissuance(body, id, opts = {})
      data, _status_code, _headers = post_invoice_reissuance_with_http_info(body, id, opts)
      data
    end

    # Reissue an invoice
    # Reissue an invoice with specified identifier string. It must be issued. (status must be &#x60;unpaid&#x60; or &#x60;past-due&#x60;). 
    # @param body InvoiceReissue resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_reissuance_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_reissuance ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.post_invoice_reissuance"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_reissuance"
      end
      # resource path
      local_var_path = '/invoices/{id}/reissue'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_reissuance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Apply a transaction to an invoice
    # Apply a transaction to an invoice. The invoice must be unpaid. The transaction must have a non-zero unused amount (not fully applied to other invoices). 
    # @param body InvoiceTransaction resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_transaction(body, id, opts = {})
      data, _status_code, _headers = post_invoice_transaction_with_http_info(body, id, opts)
      data
    end

    # Apply a transaction to an invoice
    # Apply a transaction to an invoice. The invoice must be unpaid. The transaction must have a non-zero unused amount (not fully applied to other invoices). 
    # @param body InvoiceTransaction resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_transaction_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_transaction ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.post_invoice_transaction"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_transaction"
      end
      # resource path
      local_var_path = '/invoices/{id}/transaction'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_transaction\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Void an invoice
    # Void an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def post_invoice_void(id, opts = {})
      data, _status_code, _headers = post_invoice_void_with_http_info(id, opts)
      data
    end

    # Void an invoice
    # Void an invoice with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def post_invoice_void_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.post_invoice_void ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.post_invoice_void"
      end
      # resource path
      local_var_path = '/invoices/{id}/void'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#post_invoice_void\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update an invoice with predefined ID
    # Create or update an invoice with predefined identifier string. 
    # @param body Invoice resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Invoice]
    def put_invoice(body, id, opts = {})
      data, _status_code, _headers = put_invoice_with_http_info(body, id, opts)
      data
    end

    # Create or update an invoice with predefined ID
    # Create or update an invoice with predefined identifier string. 
    # @param body Invoice resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Invoice, Integer, Hash)>] Invoice data, response status code and response headers
    def put_invoice_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.put_invoice ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.put_invoice"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.put_invoice"
      end
      # resource path
      local_var_path = '/invoices/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Invoice' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#put_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update an invoice item
    # Update an invoice item. 
    # @param body InvoiceItem resource.
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [InvoiceItem]
    def put_invoice_item(body, id, item_id, opts = {})
      data, _status_code, _headers = put_invoice_item_with_http_info(body, id, item_id, opts)
      data
    end

    # Update an invoice item
    # Update an invoice item. 
    # @param body InvoiceItem resource.
    # @param id The resource identifier string.
    # @param item_id The invoice item ID.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(InvoiceItem, Integer, Hash)>] InvoiceItem data, response status code and response headers
    def put_invoice_item_with_http_info(body, id, item_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.put_invoice_item ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling InvoicesApi.put_invoice_item"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.put_invoice_item"
      end
      # verify the required parameter 'item_id' is set
      if @api_client.config.client_side_validation && item_id.nil?
        fail ArgumentError, "Missing the required parameter 'item_id' when calling InvoicesApi.put_invoice_item"
      end
      # resource path
      local_var_path = '/invoices/{id}/items/{itemId}'.sub('{' + 'id' + '}', id.to_s).sub('{' + 'itemId' + '}', item_id.to_s)

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

      return_type = opts[:return_type] || 'InvoiceItem' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#put_invoice_item\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
