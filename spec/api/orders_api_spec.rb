=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

require 'spec_helper'
require 'json'

# Unit tests for RebillySdk::OrdersApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'OrdersApi' do
  before do
    # run before each test
    @instance = RebillySdk::OrdersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of OrdersApi' do
    it 'should create an instance of OrdersApi' do
      expect(@instance).to be_instance_of(RebillySdk::OrdersApi)
    end
  end

  # unit tests for delete_subscription
  # Delete a pending order
  # Delete a pending order with predefined identifier string. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [nil]
  describe 'delete_subscription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_subscription_cancellation
  # Delete a cancellation
  # Delete an order&#x27;s cancellation. Only draft can be deleted.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [nil]
  describe 'delete_subscription_cancellation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription
  # Retrieve an order
  # Retrieve an order with specified identifier string. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Subscription]
  describe 'get_subscription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_cancellation
  # Retrieve an order cancellation
  # Retrieve an order cancellation with specified identifier string.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [SubscriptionCancellation]
  describe 'get_subscription_cancellation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_cancellation_collection
  # Retrieve a list of cancellations
  # Retrieve a list of cancellations for all subscriptions.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [Integer] :limit The collection items limit.
  # @option opts [Integer] :offset The collection items offset.
  # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
  # @return [Array<SubscriptionCancellation>]
  describe 'get_subscription_cancellation_collection test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_collection
  # Retrieve a list of orders
  # Retrieve a list of orders. 
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
  # @option opts [Integer] :limit The collection items limit.
  # @option opts [Integer] :offset The collection items offset.
  # @option opts [String] :q The partial search of the text fields.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Array<Subscription>]
  describe 'get_subscription_collection test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_reactivation
  # Retrieve an order reactivation
  # Retrieve an order reactivation with specified identifier string.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [SubscriptionReactivation]
  describe 'get_subscription_reactivation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_reactivation_collection
  # Retrieve a list of reactivations
  # Retrieve a list of reactivations for all subscriptions.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [Integer] :limit The collection items limit.
  # @option opts [Integer] :offset The collection items offset.
  # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
  # @return [Array<SubscriptionReactivation>]
  describe 'get_subscription_reactivation_collection test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscription_upcoming_invoice_collection
  # Retrieve subscription order&#x27;s upcoming invoice
  # Retrieve an upcoming invoice from the specified subscription order. The endpoint is temporary before upcoming invoices get a complete integration. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Array<Invoice>]
  describe 'get_subscription_upcoming_invoice_collection test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_preview_order
  # Preview an order
  # Use order preview before making an actual order.
  # @param [Hash] opts the optional parameters
  # @option opts [OrderPreview] :body 
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [OrderPreview]
  describe 'post_preview_order test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription
  # Create an order
  # Create an order. Consider using the upsert. operation to accomplish this task. 
  # @param body Order resource.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Subscription]
  describe 'post_subscription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription_cancellation
  # Cancel an order
  # Cancel an order or preview the cancellation parameters before that.
  # @param body Cancellation resource.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [SubscriptionCancellation]
  describe 'post_subscription_cancellation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription_interim_invoice
  # Issue an interim invoice for a subscription order
  # Issue an interim invoice for a subscription, typically used in conjunction. with plan changes and pro rata adjustments. This process creates an invoice, adds the subscription&#x27;s line items to the invoice, and issues the invoice, and applies payment to it if a transaction id is supplied. 
  # @param body Issue an interim invoice.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Invoice]
  describe 'post_subscription_interim_invoice test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription_items_change
  # Change an order&#x27;s items
  # Change an order&#x27;s items or quantities and designate when and if there should be pro-rata credits given. 
  # @param body Change items request.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Subscription]
  describe 'post_subscription_items_change test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription_reactivation
  # Reactivate an order
  # Reactivate a subscription.
  # @param body Reactivation resource.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [SubscriptionReactivation]
  describe 'post_subscription_reactivation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_subscription_void
  # Void an order
  # Void a pending order with predefined identifier string. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Subscription]
  describe 'post_subscription_void test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_upcoming_invoice_issuance
  # Issue an upcoming invoice for early pay
  # Issue an upcoming invoice with specified identifier string for early pay. 
  # @param body InvoiceIssue resource.
  # @param id The resource identifier string.
  # @param invoice_id The Upcoming Invoice ID.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Invoice]
  describe 'post_upcoming_invoice_issuance test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_subscription
  # Upsert an order with predefined ID
  # Create or update an order with predefined identifier string. 
  # @param body Order resource.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Subscription]
  describe 'put_subscription test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_subscription_cancellation
  # Cancel an order
  # Cancel a subscription.
  # @param body Cancellation resource.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [SubscriptionCancellation]
  describe 'put_subscription_cancellation test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
