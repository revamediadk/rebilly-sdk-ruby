# RebillySdk::OrdersApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_subscription**](OrdersApi.md#delete_subscription) | **DELETE** /subscriptions/{id} | Delete a pending order
[**delete_subscription_cancellation**](OrdersApi.md#delete_subscription_cancellation) | **DELETE** /subscription-cancellations/{id} | Delete a cancellation
[**get_subscription**](OrdersApi.md#get_subscription) | **GET** /subscriptions/{id} | Retrieve an order
[**get_subscription_cancellation**](OrdersApi.md#get_subscription_cancellation) | **GET** /subscription-cancellations/{id} | Retrieve an order cancellation
[**get_subscription_cancellation_collection**](OrdersApi.md#get_subscription_cancellation_collection) | **GET** /subscription-cancellations | Retrieve a list of cancellations
[**get_subscription_collection**](OrdersApi.md#get_subscription_collection) | **GET** /subscriptions | Retrieve a list of orders
[**get_subscription_reactivation**](OrdersApi.md#get_subscription_reactivation) | **GET** /subscription-reactivations/{id} | Retrieve an order reactivation
[**get_subscription_reactivation_collection**](OrdersApi.md#get_subscription_reactivation_collection) | **GET** /subscription-reactivations | Retrieve a list of reactivations
[**get_subscription_upcoming_invoice_collection**](OrdersApi.md#get_subscription_upcoming_invoice_collection) | **GET** /subscriptions/{id}/upcoming-invoices | Retrieve subscription order&#x27;s upcoming invoice
[**post_preview_order**](OrdersApi.md#post_preview_order) | **POST** /previews/orders | Preview an order
[**post_subscription**](OrdersApi.md#post_subscription) | **POST** /subscriptions | Create an order
[**post_subscription_cancellation**](OrdersApi.md#post_subscription_cancellation) | **POST** /subscription-cancellations | Cancel an order
[**post_subscription_interim_invoice**](OrdersApi.md#post_subscription_interim_invoice) | **POST** /subscriptions/{id}/interim-invoice | Issue an interim invoice for a subscription order
[**post_subscription_items_change**](OrdersApi.md#post_subscription_items_change) | **POST** /subscriptions/{id}/change-items | Change an order&#x27;s items
[**post_subscription_reactivation**](OrdersApi.md#post_subscription_reactivation) | **POST** /subscription-reactivations | Reactivate an order
[**post_subscription_void**](OrdersApi.md#post_subscription_void) | **POST** /subscriptions/{id}/void | Void an order
[**post_upcoming_invoice_issuance**](OrdersApi.md#post_upcoming_invoice_issuance) | **POST** /subscriptions/{id}/upcoming-invoices/{invoiceId}/issue | Issue an upcoming invoice for early pay
[**put_subscription**](OrdersApi.md#put_subscription) | **PUT** /subscriptions/{id} | Upsert an order with predefined ID
[**put_subscription_cancellation**](OrdersApi.md#put_subscription_cancellation) | **PUT** /subscription-cancellations/{id} | Cancel an order

# **delete_subscription**
> delete_subscription(id, opts)

Delete a pending order

Delete a pending order with predefined identifier string. 

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a pending order
  api_instance.delete_subscription(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->delete_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_subscription_cancellation**
> delete_subscription_cancellation(id, opts)

Delete a cancellation

Delete an order's cancellation. Only draft can be deleted.

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a cancellation
  api_instance.delete_subscription_cancellation(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->delete_subscription_cancellation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription**
> Subscription get_subscription(id, opts)

Retrieve an order

Retrieve an order with specified identifier string. 

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve an order
  result = api_instance.get_subscription(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Subscription**](Subscription.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_cancellation**
> SubscriptionCancellation get_subscription_cancellation(id, opts)

Retrieve an order cancellation

Retrieve an order cancellation with specified identifier string.

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an order cancellation
  result = api_instance.get_subscription_cancellation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_cancellation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**SubscriptionCancellation**](SubscriptionCancellation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_cancellation_collection**
> Array&lt;SubscriptionCancellation&gt; get_subscription_cancellation_collection(opts)

Retrieve a list of cancellations

Retrieve a list of cancellations for all subscriptions.

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

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of cancellations
  result = api_instance.get_subscription_cancellation_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_cancellation_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 

### Return type

[**Array&lt;SubscriptionCancellation&gt;**](SubscriptionCancellation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_collection**
> Array&lt;Subscription&gt; get_subscription_collection(opts)

Retrieve a list of orders

Retrieve a list of orders. 

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

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example', # String | The partial search of the text fields.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a list of orders
  result = api_instance.get_subscription_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **q** | **String**| The partial search of the text fields. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Array&lt;Subscription&gt;**](Subscription.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_reactivation**
> SubscriptionReactivation get_subscription_reactivation(id, opts)

Retrieve an order reactivation

Retrieve an order reactivation with specified identifier string.

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an order reactivation
  result = api_instance.get_subscription_reactivation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_reactivation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**SubscriptionReactivation**](SubscriptionReactivation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_reactivation_collection**
> Array&lt;SubscriptionReactivation&gt; get_subscription_reactivation_collection(opts)

Retrieve a list of reactivations

Retrieve a list of reactivations for all subscriptions.

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

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of reactivations
  result = api_instance.get_subscription_reactivation_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_reactivation_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 

### Return type

[**Array&lt;SubscriptionReactivation&gt;**](SubscriptionReactivation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_upcoming_invoice_collection**
> Array&lt;Invoice&gt; get_subscription_upcoming_invoice_collection(id, opts)

Retrieve subscription order's upcoming invoice

Retrieve an upcoming invoice from the specified subscription order. The endpoint is temporary before upcoming invoices get a complete integration. 

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve subscription order's upcoming invoice
  result = api_instance.get_subscription_upcoming_invoice_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_upcoming_invoice_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Array&lt;Invoice&gt;**](Invoice.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_preview_order**
> OrderPreview post_preview_order(opts)

Preview an order

Use order preview before making an actual order.

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

api_instance = RebillySdk::OrdersApi.new
opts = { 
  body: RebillySdk::OrderPreview.new # OrderPreview | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Preview an order
  result = api_instance.post_preview_order(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_preview_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**OrderPreview**](OrderPreview.md)|  | [optional] 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**OrderPreview**](OrderPreview.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription**
> Subscription post_subscription(body, opts)

Create an order

Create an order. Consider using the upsert. operation to accomplish this task. 

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::Subscription.new # Subscription | Order resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Create an order
  result = api_instance.post_subscription(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Subscription**](Subscription.md)| Order resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Subscription**](Subscription.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription_cancellation**
> SubscriptionCancellation post_subscription_cancellation(body, opts)

Cancel an order

Cancel an order or preview the cancellation parameters before that.

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionCancellation.new # SubscriptionCancellation | Cancellation resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Cancel an order
  result = api_instance.post_subscription_cancellation(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_cancellation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionCancellation**](SubscriptionCancellation.md)| Cancellation resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**SubscriptionCancellation**](SubscriptionCancellation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription_interim_invoice**
> Invoice post_subscription_interim_invoice(bodyid, opts)

Issue an interim invoice for a subscription order

Issue an interim invoice for a subscription, typically used in conjunction. with plan changes and pro rata adjustments. This process creates an invoice, adds the subscription's line items to the invoice, and issues the invoice, and applies payment to it if a transaction id is supplied. 

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionInvoice.new # SubscriptionInvoice | Issue an interim invoice.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Issue an interim invoice for a subscription order
  result = api_instance.post_subscription_interim_invoice(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_interim_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionInvoice**](SubscriptionInvoice.md)| Issue an interim invoice. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Invoice**](Invoice.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription_items_change**
> Subscription post_subscription_items_change(bodyid, opts)

Change an order's items

Change an order's items or quantities and designate when and if there should be pro-rata credits given. 

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionChange.new # SubscriptionChange | Change items request.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Change an order's items
  result = api_instance.post_subscription_items_change(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_items_change: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionChange**](SubscriptionChange.md)| Change items request. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Subscription**](Subscription.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription_reactivation**
> SubscriptionReactivation post_subscription_reactivation(body, opts)

Reactivate an order

Reactivate a subscription.

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionReactivation.new # SubscriptionReactivation | Reactivation resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Reactivate an order
  result = api_instance.post_subscription_reactivation(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_reactivation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionReactivation**](SubscriptionReactivation.md)| Reactivation resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**SubscriptionReactivation**](SubscriptionReactivation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_subscription_void**
> Subscription post_subscription_void(id, opts)

Void an order

Void a pending order with predefined identifier string. 

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

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Void an order
  result = api_instance.post_subscription_void(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_void: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Subscription**](Subscription.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_upcoming_invoice_issuance**
> Invoice post_upcoming_invoice_issuance(bodyidinvoice_id, opts)

Issue an upcoming invoice for early pay

Issue an upcoming invoice with specified identifier string for early pay. 

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::InvoiceIssue.new # InvoiceIssue | InvoiceIssue resource.
id = 'id_example' # String | The resource identifier string.
invoice_id = 'invoice_id_example' # String | The Upcoming Invoice ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Issue an upcoming invoice for early pay
  result = api_instance.post_upcoming_invoice_issuance(bodyidinvoice_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_upcoming_invoice_issuance: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InvoiceIssue**](InvoiceIssue.md)| InvoiceIssue resource. | 
 **id** | **String**| The resource identifier string. | 
 **invoice_id** | **String**| The Upcoming Invoice ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Invoice**](Invoice.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_subscription**
> Subscription put_subscription(bodyid, opts)

Upsert an order with predefined ID

Create or update an order with predefined identifier string. 

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::Subscription.new # Subscription | Order resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Upsert an order with predefined ID
  result = api_instance.put_subscription(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->put_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Subscription**](Subscription.md)| Order resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: &#x60;expand&#x3D;recentInvoice,initialInvoice&#x60;). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Subscription**](Subscription.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_subscription_cancellation**
> SubscriptionCancellation put_subscription_cancellation(bodyid, opts)

Cancel an order

Cancel a subscription.

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

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionCancellation.new # SubscriptionCancellation | Cancellation resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Cancel an order
  result = api_instance.put_subscription_cancellation(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->put_subscription_cancellation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SubscriptionCancellation**](SubscriptionCancellation.md)| Cancellation resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**SubscriptionCancellation**](SubscriptionCancellation.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



