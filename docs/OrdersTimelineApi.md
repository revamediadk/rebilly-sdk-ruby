# RebillySdk::OrdersTimelineApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_subscription_timeline**](OrdersTimelineApi.md#delete_subscription_timeline) | **DELETE** /subscriptions/{id}/timeline/{messageId} | Delete an Order Timeline message
[**get_subscription_timeline**](OrdersTimelineApi.md#get_subscription_timeline) | **GET** /subscriptions/{id}/timeline/{messageId} | Retrieve an Order Timeline message
[**get_subscription_timeline_collection**](OrdersTimelineApi.md#get_subscription_timeline_collection) | **GET** /subscriptions/{id}/timeline | Retrieve a list of order timeline messages
[**post_subscription_timeline**](OrdersTimelineApi.md#post_subscription_timeline) | **POST** /subscriptions/{id}/timeline | Create an order Timeline comment

# **delete_subscription_timeline**
> delete_subscription_timeline(id, message_id, opts)

Delete an Order Timeline message

Delete an Order Timeline message with predefined identifier string. 

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

api_instance = RebillySdk::OrdersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Order Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete an Order Timeline message
  api_instance.delete_subscription_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->delete_subscription_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Order Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_timeline**
> OrderTimeline get_subscription_timeline(id, message_id, opts)

Retrieve an Order Timeline message

Retrieve a order message with specified identifier string. 

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

api_instance = RebillySdk::OrdersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Order Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an Order Timeline message
  result = api_instance.get_subscription_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->get_subscription_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Order Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**OrderTimeline**](OrderTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_subscription_timeline_collection**
> Array&lt;OrderTimeline&gt; get_subscription_timeline_collection(id, opts)

Retrieve a list of order timeline messages

Retrieve a list of order timeline messages. 

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

api_instance = RebillySdk::OrdersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of order timeline messages
  result = api_instance.get_subscription_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->get_subscription_timeline_collection: #{e}"
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
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 
 **q** | **String**| The partial search of the text fields. | [optional] 

### Return type

[**Array&lt;OrderTimeline&gt;**](OrderTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_subscription_timeline**
> OrderTimeline post_subscription_timeline(bodyid, opts)

Create an order Timeline comment

Create an order Timeline comment. 

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

api_instance = RebillySdk::OrdersTimelineApi.new
body = RebillySdk::OrderTimeline.new # OrderTimeline | Order Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an order Timeline comment
  result = api_instance.post_subscription_timeline(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->post_subscription_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**OrderTimeline**](OrderTimeline.md)| Order Timeline resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**OrderTimeline**](OrderTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



