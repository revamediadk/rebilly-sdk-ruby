# RebillySdk::TransactionsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_transaction**](TransactionsApi.md#get_transaction) | **GET** /transactions/{id} | Retrieve a Transaction
[**get_transaction_collection**](TransactionsApi.md#get_transaction_collection) | **GET** /transactions | Retrieve a list of transactions
[**patch_transaction**](TransactionsApi.md#patch_transaction) | **PATCH** /transactions/{id} | Update a transaction
[**post_payout**](TransactionsApi.md#post_payout) | **POST** /payouts | Create a credit transaction
[**post_ready_to_pay**](TransactionsApi.md#post_ready_to_pay) | **POST** /ready-to-pay | Ready to Pay
[**post_transaction**](TransactionsApi.md#post_transaction) | **POST** /transactions | Create a transaction
[**post_transaction_query**](TransactionsApi.md#post_transaction_query) | **POST** /transactions/{id}/query | Query a Transaction
[**post_transaction_refund**](TransactionsApi.md#post_transaction_refund) | **POST** /transactions/{id}/refund | Refund a Transaction
[**post_transaction_update**](TransactionsApi.md#post_transaction_update) | **POST** /transactions/{id}/update | Update a Transaction status

# **get_transaction**
> Transaction get_transaction(id, opts)

Retrieve a Transaction

Retrieve a Transaction with specified identifier string. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a Transaction
  result = api_instance.get_transaction(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->get_transaction: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_transaction_collection**
> Array&lt;Transaction&gt; get_transaction_collection(opts)

Retrieve a list of transactions

Retrieve a list of transactions. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a list of transactions
  result = api_instance.get_transaction_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->get_transaction_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 
 **q** | **String**| The partial search of the text fields. | [optional] 
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Array&lt;Transaction&gt;**](Transaction.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **patch_transaction**
> Transaction patch_transaction(bodyid, opts)

Update a transaction

Update a transaction's custom fields. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = nil # Object | Use the patch transaction request to modify custom fields.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a transaction
  result = api_instance.patch_transaction(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->patch_transaction: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Object**](Object.md)| Use the patch transaction request to modify custom fields. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_payout**
> Transaction post_payout(body, opts)

Create a credit transaction

Create a transaction of type `credit`. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::PayoutRequest.new # PayoutRequest | Transaction resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a credit transaction
  result = api_instance.post_payout(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_payout: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PayoutRequest**](PayoutRequest.md)| Transaction resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_ready_to_pay**
> ReadyToPayMethods post_ready_to_pay(opts)

Ready to Pay

Get available payment methods for a specific transaction or a purchase.  The payment methods order shown to a customer **SHOULD** be the same as the order in the response.  The list of available methods is generated from available [Gateway Accounts](https://user-api-docs.rebilly.com/tag/Gateway-Accounts) intersected with the last matched [Rules Engine](https://user-api-docs.rebilly.com/tag/Rules#operation/PutEventRule) `adjust-ready-to-pay` action on `ready-to-pay-requested` event.  If there were no actions matched for the specific request, then all methods supported by the Gateway Accounts are sent.  To invert this behavior place an all-matching rule at the very end of the `ready-to-pay-requested` event in Rules Engine with an empty `paymentMethods` property of the `adjust-ready-to-pay` action. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
opts = { 
  body: RebillySdk::CoreReadyToPay.new # CoreReadyToPay | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Ready to Pay
  result = api_instance.post_ready_to_pay(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_ready_to_pay: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CoreReadyToPay**](CoreReadyToPay.md)|  | [optional] 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**ReadyToPayMethods**](ReadyToPayMethods.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_transaction**
> Transaction post_transaction(body, opts)

Create a transaction

Create a transaction of type `sale` or `authorize`. This endpoint supports two main styles of transactions:   1. A real-time decision and response.   2. User approval/interaction is required.  A real-time decision is very familiar.  You send a request, and inspect the `result` of the response for `approved` or `declined`.  However, many transactions, especially those for alternative methods, require the user to interact with a 3rd party.  You may be able to envision PayPal, for example, the user must give permission to complete the payment (or accept the billing agreement).  Even payment cards may require user approval in the case of 3D secure authentication.  In the event that approval is required, you will receive a response back and notice that the `result` is `unknown`.  You will find that the `status` is `waiting-approval`. And you will find in the `_links` section of the response a link for the `approvalUrl`.  In this case you would either open the `approvalUrl` in an iframe or in a pop (better workflow for mobile). 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionRequest.new # TransactionRequest | Transaction resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Create a transaction
  result = api_instance.post_transaction(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionRequest**](TransactionRequest.md)| Transaction resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_transaction_query**
> TransactionQuery post_transaction_query(id, opts)

Query a Transaction

Query a Transaction with a specified identifier string. The query will contact the gateway account to find the result and amount/currency. The response should be analyzed. If deemed appropriate, the transaction could be updated using the Transaction Update API. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Query a Transaction
  result = api_instance.post_transaction_query(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_query: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**TransactionQuery**](TransactionQuery.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_transaction_refund**
> Transaction post_transaction_refund(bodyid, opts)

Refund a Transaction

Refund a Transaction with specified identifier string. Note that the refund will be in the same currency as the original transaction. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionRefund.new # TransactionRefund | Transaction resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Refund a Transaction
  result = api_instance.post_transaction_refund(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionRefund**](TransactionRefund.md)| Transaction resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_transaction_update**
> Transaction post_transaction_update(bodyid, opts)

Update a Transaction status

Update a Transaction manually to completed status with given result with optional currency and amount.

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionUpdate.new # TransactionUpdate | 
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a Transaction status
  result = api_instance.post_transaction_update(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_update: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionUpdate**](TransactionUpdate.md)|  | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Transaction**](Transaction.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



