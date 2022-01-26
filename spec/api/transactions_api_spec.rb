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

# Unit tests for RebillySdk::TransactionsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TransactionsApi' do
  before do
    # run before each test
    @instance = RebillySdk::TransactionsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TransactionsApi' do
    it 'should create an instance of TransactionsApi' do
      expect(@instance).to be_instance_of(RebillySdk::TransactionsApi)
    end
  end

  # unit tests for get_transaction
  # Retrieve a Transaction
  # Retrieve a Transaction with specified identifier string. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Transaction]
  describe 'get_transaction test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_transaction_collection
  # Retrieve a list of transactions
  # Retrieve a list of transactions. 
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [Integer] :limit The collection items limit.
  # @option opts [Integer] :offset The collection items offset.
  # @option opts [String] :filter The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  # @option opts [String] :q The partial search of the text fields.
  # @option opts [Array<String>] :sort The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort).
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Array<Transaction>]
  describe 'get_transaction_collection test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_transaction
  # Update a transaction
  # Update a transaction&#x27;s custom fields. 
  # @param body Use the patch transaction request to modify custom fields.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Transaction]
  describe 'patch_transaction test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_payout
  # Create a credit transaction
  # Create a transaction of type &#x60;credit&#x60;. 
  # @param body Transaction resource.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Transaction]
  describe 'post_payout test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_ready_to_pay
  # Ready to Pay
  # Get available payment methods for a specific transaction or a purchase.  The payment methods order shown to a customer **SHOULD** be the same as the order in the response.  The list of available methods is generated from available [Gateway Accounts](https://user-api-docs.rebilly.com/tag/Gateway-Accounts) intersected with the last matched [Rules Engine](https://user-api-docs.rebilly.com/tag/Rules#operation/PutEventRule) &#x60;adjust-ready-to-pay&#x60; action on &#x60;ready-to-pay-requested&#x60; event.  If there were no actions matched for the specific request, then all methods supported by the Gateway Accounts are sent.  To invert this behavior place an all-matching rule at the very end of the &#x60;ready-to-pay-requested&#x60; event in Rules Engine with an empty &#x60;paymentMethods&#x60; property of the &#x60;adjust-ready-to-pay&#x60; action. 
  # @param [Hash] opts the optional parameters
  # @option opts [CoreReadyToPay] :body 
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [ReadyToPayMethods]
  describe 'post_ready_to_pay test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_transaction
  # Create a transaction
  # Create a transaction of type &#x60;sale&#x60; or &#x60;authorize&#x60;. This endpoint supports two main styles of transactions:   1. A real-time decision and response.   2. User approval/interaction is required.  A real-time decision is very familiar.  You send a request, and inspect the &#x60;result&#x60; of the response for &#x60;approved&#x60; or &#x60;declined&#x60;.  However, many transactions, especially those for alternative methods, require the user to interact with a 3rd party.  You may be able to envision PayPal, for example, the user must give permission to complete the payment (or accept the billing agreement).  Even payment cards may require user approval in the case of 3D secure authentication.  In the event that approval is required, you will receive a response back and notice that the &#x60;result&#x60; is &#x60;unknown&#x60;.  You will find that the &#x60;status&#x60; is &#x60;waiting-approval&#x60;. And you will find in the &#x60;_links&#x60; section of the response a link for the &#x60;approvalUrl&#x60;.  In this case you would either open the &#x60;approvalUrl&#x60; in an iframe or in a pop (better workflow for mobile). 
  # @param body Transaction resource.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @option opts [String] :expand Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  # @return [Transaction]
  describe 'post_transaction test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_transaction_query
  # Query a Transaction
  # Query a Transaction with a specified identifier string. The query will contact the gateway account to find the result and amount/currency. The response should be analyzed. If deemed appropriate, the transaction could be updated using the Transaction Update API. 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [TransactionQuery]
  describe 'post_transaction_query test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_transaction_refund
  # Refund a Transaction
  # Refund a Transaction with specified identifier string. Note that the refund will be in the same currency as the original transaction. 
  # @param body Transaction resource.
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Transaction]
  describe 'post_transaction_refund test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_transaction_update
  # Update a Transaction status
  # Update a Transaction manually to completed status with given result with optional currency and amount.
  # @param body 
  # @param id The resource identifier string.
  # @param [Hash] opts the optional parameters
  # @option opts [ResourceId] :organization_id Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead.
  # @return [Transaction]
  describe 'post_transaction_update test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
