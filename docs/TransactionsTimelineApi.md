# RebillySdk::TransactionsTimelineApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_transaction_timeline**](TransactionsTimelineApi.md#delete_transaction_timeline) | **DELETE** /transactions/{id}/timeline/{messageId} | Delete a Transaction Timeline message
[**get_transaction_timeline**](TransactionsTimelineApi.md#get_transaction_timeline) | **GET** /transactions/{id}/timeline/{messageId} | Retrieve a transaction Timeline message
[**get_transaction_timeline_collection**](TransactionsTimelineApi.md#get_transaction_timeline_collection) | **GET** /transactions/{id}/timeline | Retrieve a list of transaction timeline messages
[**post_transaction_timeline**](TransactionsTimelineApi.md#post_transaction_timeline) | **POST** /transactions/{id}/timeline | Create a transaction Timeline comment

# **delete_transaction_timeline**
> delete_transaction_timeline(id, message_id, opts)

Delete a Transaction Timeline message

Delete a Transaction Timeline message with predefined identifier string. 

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

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Transaction Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Transaction Timeline message
  api_instance.delete_transaction_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->delete_transaction_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Transaction Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_transaction_timeline**
> TransactionTimeline get_transaction_timeline(id, message_id, opts)

Retrieve a transaction Timeline message

Retrieve a timeline message with specified identifier string. 

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

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Transaction Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a transaction Timeline message
  result = api_instance.get_transaction_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->get_transaction_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Transaction Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**TransactionTimeline**](TransactionTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_transaction_timeline_collection**
> Array&lt;TransactionTimeline&gt; get_transaction_timeline_collection(id, opts)

Retrieve a list of transaction timeline messages

Retrieve a list of transaction timeline messages. 

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

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of transaction timeline messages
  result = api_instance.get_transaction_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->get_transaction_timeline_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 

### Return type

[**Array&lt;TransactionTimeline&gt;**](TransactionTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_transaction_timeline**
> TransactionTimeline post_transaction_timeline(bodyid, opts)

Create a transaction Timeline comment

Create a transaction Timeline comment. 

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

api_instance = RebillySdk::TransactionsTimelineApi.new
body = RebillySdk::TransactionTimeline.new # TransactionTimeline | Transaction Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a transaction Timeline comment
  result = api_instance.post_transaction_timeline(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->post_transaction_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionTimeline**](TransactionTimeline.md)| Transaction Timeline resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**TransactionTimeline**](TransactionTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



