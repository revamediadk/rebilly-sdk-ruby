=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

module RebillySdk
  class CustomerAuthenticationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Logout a customer
    # Logout a customer. 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_authentication_token(token, opts = {})
      delete_authentication_token_with_http_info(token, opts)
      nil
    end

    # Logout a customer
    # Logout a customer. 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_authentication_token_with_http_info(token, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.delete_authentication_token ...'
      end
      # verify the required parameter 'token' is set
      if @api_client.config.client_side_validation && token.nil?
        fail ArgumentError, "Missing the required parameter 'token' when calling CustomerAuthenticationApi.delete_authentication_token"
      end
      # resource path
      local_var_path = '/authentication-tokens/{token}'.sub('{' + 'token' + '}', token.to_s)

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

      auth_names = opts[:auth_names] || ['JWT', 'PublishableApiKey', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#delete_authentication_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Delete a credential
    # Delete a credential with predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_credential(id, opts = {})
      delete_credential_with_http_info(id, opts)
      nil
    end

    # Delete a credential
    # Delete a credential with predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_credential_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.delete_credential ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomerAuthenticationApi.delete_credential"
      end
      # resource path
      local_var_path = '/credentials/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#delete_credential\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Delete a Reset Password Token
    # Delete a Reset Password Token with predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [nil]
    def delete_password_token(id, opts = {})
      delete_password_token_with_http_info(id, opts)
      nil
    end

    # Delete a Reset Password Token
    # Delete a Reset Password Token with predefined identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_password_token_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.delete_password_token ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomerAuthenticationApi.delete_password_token"
      end
      # resource path
      local_var_path = '/password-tokens/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#delete_password_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read current authentication options
    # Read current authentication options. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<AuthenticationOptions>]
    def get_authentication_option(opts = {})
      data, _status_code, _headers = get_authentication_option_with_http_info(opts)
      data
    end

    # Read current authentication options
    # Read current authentication options. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Array<AuthenticationOptions>, Integer, Hash)>] Array<AuthenticationOptions> data, response status code and response headers
    def get_authentication_option_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_authentication_option ...'
      end
      # resource path
      local_var_path = '/authentication-options'

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

      return_type = opts[:return_type] || 'Array<AuthenticationOptions>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_authentication_option\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of auth tokens
    # Retrieve a list of auth tokens. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<AuthenticationToken>]
    def get_authentication_token_collection(opts = {})
      data, _status_code, _headers = get_authentication_token_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of auth tokens
    # Retrieve a list of auth tokens. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<(Array<AuthenticationToken>, Integer, Hash)>] Array<AuthenticationToken> data, response status code and response headers
    def get_authentication_token_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_authentication_token_collection ...'
      end
      # resource path
      local_var_path = '/authentication-tokens'

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

      return_type = opts[:return_type] || 'Array<AuthenticationToken>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_authentication_token_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Verify
    # Verify an authentication token. 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [AuthenticationToken]
    def get_authentication_token_verification(token, opts = {})
      data, _status_code, _headers = get_authentication_token_verification_with_http_info(token, opts)
      data
    end

    # Verify
    # Verify an authentication token. 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(AuthenticationToken, Integer, Hash)>] AuthenticationToken data, response status code and response headers
    def get_authentication_token_verification_with_http_info(token, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_authentication_token_verification ...'
      end
      # verify the required parameter 'token' is set
      if @api_client.config.client_side_validation && token.nil?
        fail ArgumentError, "Missing the required parameter 'token' when calling CustomerAuthenticationApi.get_authentication_token_verification"
      end
      # resource path
      local_var_path = '/authentication-tokens/{token}'.sub('{' + 'token' + '}', token.to_s)

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

      return_type = opts[:return_type] || 'AuthenticationToken' 

      auth_names = opts[:auth_names] || ['JWT', 'PublishableApiKey', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_authentication_token_verification\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a credential
    # Retrieve a credential with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Credential]
    def get_credential(id, opts = {})
      data, _status_code, _headers = get_credential_with_http_info(id, opts)
      data
    end

    # Retrieve a credential
    # Retrieve a credential with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Credential, Integer, Hash)>] Credential data, response status code and response headers
    def get_credential_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_credential ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomerAuthenticationApi.get_credential"
      end
      # resource path
      local_var_path = '/credentials/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Credential' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_credential\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of credentials
    # Retrieve a list of credentials. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<Credential>]
    def get_credential_collection(opts = {})
      data, _status_code, _headers = get_credential_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of credentials
    # Retrieve a list of credentials. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<(Array<Credential>, Integer, Hash)>] Array<Credential> data, response status code and response headers
    def get_credential_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_credential_collection ...'
      end
      # resource path
      local_var_path = '/credentials'

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

      return_type = opts[:return_type] || 'Array<Credential>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_credential_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a Reset Password Token
    # Retrieve a Reset Password Token with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [ResetPasswordToken]
    def get_password_token(id, opts = {})
      data, _status_code, _headers = get_password_token_with_http_info(id, opts)
      data
    end

    # Retrieve a Reset Password Token
    # Retrieve a Reset Password Token with specified identifier string. 
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(ResetPasswordToken, Integer, Hash)>] ResetPasswordToken data, response status code and response headers
    def get_password_token_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_password_token ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomerAuthenticationApi.get_password_token"
      end
      # resource path
      local_var_path = '/password-tokens/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'ResetPasswordToken' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_password_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Retrieve a list of tokens
    # Retrieve a list of tokens. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<ResetPasswordToken>]
    def get_password_token_collection(opts = {})
      data, _status_code, _headers = get_password_token_collection_with_http_info(opts)
      data
    end

    # Retrieve a list of tokens
    # Retrieve a list of tokens. 
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @option opts [Integer] :limit The collection items limit.
    # @option opts [Integer] :offset The collection items offset.
    # @return [Array<(Array<ResetPasswordToken>, Integer, Hash)>] Array<ResetPasswordToken> data, response status code and response headers
    def get_password_token_collection_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.get_password_token_collection ...'
      end
      # resource path
      local_var_path = '/password-tokens'

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

      return_type = opts[:return_type] || 'Array<ResetPasswordToken>' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#get_password_token_collection\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Login
    # Login a customer. 
    # @param body AuthenticationToken resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [AuthenticationToken]
    def post_authentication_token(body, opts = {})
      data, _status_code, _headers = post_authentication_token_with_http_info(body, opts)
      data
    end

    # Login
    # Login a customer. 
    # @param body AuthenticationToken resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(AuthenticationToken, Integer, Hash)>] AuthenticationToken data, response status code and response headers
    def post_authentication_token_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.post_authentication_token ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.post_authentication_token"
      end
      # resource path
      local_var_path = '/authentication-tokens'

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

      return_type = opts[:return_type] || 'AuthenticationToken' 

      auth_names = opts[:auth_names] || ['JWT', 'PublishableApiKey', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#post_authentication_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Exchange
    # Exchange Authentication Token for JWT.  It will also invalidate an Authentication Token by default (so it can only be exchanged once). 
    # @param body 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [CustomerJWT]
    def post_authentication_token_exchange(body, token, opts = {})
      data, _status_code, _headers = post_authentication_token_exchange_with_http_info(body, token, opts)
      data
    end

    # Exchange
    # Exchange Authentication Token for JWT.  It will also invalidate an Authentication Token by default (so it can only be exchanged once). 
    # @param body 
    # @param token The token identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(CustomerJWT, Integer, Hash)>] CustomerJWT data, response status code and response headers
    def post_authentication_token_exchange_with_http_info(body, token, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.post_authentication_token_exchange ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.post_authentication_token_exchange"
      end
      # verify the required parameter 'token' is set
      if @api_client.config.client_side_validation && token.nil?
        fail ArgumentError, "Missing the required parameter 'token' when calling CustomerAuthenticationApi.post_authentication_token_exchange"
      end
      # resource path
      local_var_path = '/authentication-tokens/{token}/exchange'.sub('{' + 'token' + '}', token.to_s)

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

      return_type = opts[:return_type] || 'CustomerJWT' 

      auth_names = opts[:auth_names] || ['JWT', 'PublishableApiKey', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#post_authentication_token_exchange\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a credential
    # Create a credential. 
    # @param body Credential resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Credential]
    def post_credential(body, opts = {})
      data, _status_code, _headers = post_credential_with_http_info(body, opts)
      data
    end

    # Create a credential
    # Create a credential. 
    # @param body Credential resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Credential, Integer, Hash)>] Credential data, response status code and response headers
    def post_credential_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.post_credential ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.post_credential"
      end
      # resource path
      local_var_path = '/credentials'

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

      return_type = opts[:return_type] || 'Credential' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#post_credential\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create a Reset Password Token
    # Create a Reset Password Token. 
    # @param body ResetPasswordToken resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [ResetPasswordToken]
    def post_password_token(body, opts = {})
      data, _status_code, _headers = post_password_token_with_http_info(body, opts)
      data
    end

    # Create a Reset Password Token
    # Create a Reset Password Token. 
    # @param body ResetPasswordToken resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(ResetPasswordToken, Integer, Hash)>] ResetPasswordToken data, response status code and response headers
    def post_password_token_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.post_password_token ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.post_password_token"
      end
      # resource path
      local_var_path = '/password-tokens'

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

      return_type = opts[:return_type] || 'ResetPasswordToken' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#post_password_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Change authentication options
    # Change options. 
    # @param body Authentication Options resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [AuthenticationOptions]
    def put_authentication_option(body, opts = {})
      data, _status_code, _headers = put_authentication_option_with_http_info(body, opts)
      data
    end

    # Change authentication options
    # Change options. 
    # @param body Authentication Options resource.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(AuthenticationOptions, Integer, Hash)>] AuthenticationOptions data, response status code and response headers
    def put_authentication_option_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.put_authentication_option ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.put_authentication_option"
      end
      # resource path
      local_var_path = '/authentication-options'

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

      return_type = opts[:return_type] || 'AuthenticationOptions' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#put_authentication_option\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a credential with predefined ID
    # Create or update a credential with predefined identifier string. 
    # @param body Credential resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Credential]
    def put_credential(body, id, opts = {})
      data, _status_code, _headers = put_credential_with_http_info(body, id, opts)
      data
    end

    # Create or update a credential with predefined ID
    # Create or update a credential with predefined identifier string. 
    # @param body Credential resource.
    # @param id The resource identifier string.
    # @param [Hash] opts the optional parameters
    # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
    # @return [Array<(Credential, Integer, Hash)>] Credential data, response status code and response headers
    def put_credential_with_http_info(body, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CustomerAuthenticationApi.put_credential ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CustomerAuthenticationApi.put_credential"
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling CustomerAuthenticationApi.put_credential"
      end
      # resource path
      local_var_path = '/credentials/{id}'.sub('{' + 'id' + '}', id.to_s)

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

      return_type = opts[:return_type] || 'Credential' 

      auth_names = opts[:auth_names] || ['JWT', 'SecretApiKey']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type)

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CustomerAuthenticationApi#put_credential\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
