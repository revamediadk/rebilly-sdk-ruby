# RebillySdk::CustomersTimelineApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer_timeline**](CustomersTimelineApi.md#delete_customer_timeline) | **DELETE** /customers/{id}/timeline/{messageId} | Delete a Customer Timeline message
[**get_customer_timeline**](CustomersTimelineApi.md#get_customer_timeline) | **GET** /customers/{id}/timeline/{messageId} | Retrieve a customer Timeline message
[**get_customer_timeline_collection**](CustomersTimelineApi.md#get_customer_timeline_collection) | **GET** /customers/{id}/timeline | Retrieve a list of customer timeline messages
[**get_customer_timeline_custom_event_type**](CustomersTimelineApi.md#get_customer_timeline_custom_event_type) | **GET** /customer-timeline-custom-events/{id} | Retrieve customer timeline custom event type with specified identifier string
[**get_customer_timeline_custom_event_type_collection**](CustomersTimelineApi.md#get_customer_timeline_custom_event_type_collection) | **GET** /customer-timeline-custom-events | Retrieve a list of customer timeline custom event types
[**get_customer_timeline_event_collection**](CustomersTimelineApi.md#get_customer_timeline_event_collection) | **GET** /customer-timeline-events | Retrieve a list of customer timeline messages for all customers
[**post_customer_timeline**](CustomersTimelineApi.md#post_customer_timeline) | **POST** /customers/{id}/timeline | Create a customer Timeline comment or custom defined event
[**post_customer_timeline_custom_event_type**](CustomersTimelineApi.md#post_customer_timeline_custom_event_type) | **POST** /customer-timeline-custom-events | Create Customer Timeline custom event type

# **delete_customer_timeline**
> delete_customer_timeline(id, message_id, opts)

Delete a Customer Timeline message

Delete a Customer Timeline message with predefined identifier string. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Customer Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Customer Timeline message
  api_instance.delete_customer_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->delete_customer_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Customer Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_timeline**
> CustomerTimeline get_customer_timeline(id, message_id, opts)

Retrieve a customer Timeline message

Retrieve a customer message with specified identifier string. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Customer Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a customer Timeline message
  result = api_instance.get_customer_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Customer Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomerTimeline**](CustomerTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_timeline_collection**
> Array&lt;CustomerTimeline&gt; get_customer_timeline_collection(id, opts)

Retrieve a list of customer timeline messages

Retrieve a list of customer timeline messages. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
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
  #Retrieve a list of customer timeline messages
  result = api_instance.get_customer_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_collection: #{e}"
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

[**Array&lt;CustomerTimeline&gt;**](CustomerTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_timeline_custom_event_type**
> CustomerTimelineCustomEvent get_customer_timeline_custom_event_type(id, opts)

Retrieve customer timeline custom event type with specified identifier string

Retrieve customer timeline custom event type. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve customer timeline custom event type with specified identifier string
  result = api_instance.get_customer_timeline_custom_event_type(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_custom_event_type: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomerTimelineCustomEvent**](CustomerTimelineCustomEvent.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_timeline_custom_event_type_collection**
> Array&lt;CustomerTimelineCustomEvent&gt; get_customer_timeline_custom_event_type_collection(opts)

Retrieve a list of customer timeline custom event types

Retrieve a list of customer timeline custom event types. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of customer timeline custom event types
  result = api_instance.get_customer_timeline_custom_event_type_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_custom_event_type_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 

### Return type

[**Array&lt;CustomerTimelineCustomEvent&gt;**](CustomerTimelineCustomEvent.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_timeline_event_collection**
> Array&lt;CustomerTimeline&gt; get_customer_timeline_event_collection(opts)

Retrieve a list of customer timeline messages for all customers

Retrieve a list of customer timeline messages for all customers. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of customer timeline messages for all customers
  result = api_instance.get_customer_timeline_event_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_event_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 
 **filter** | **String**| The collection items filter requires a special format. Use \&quot;,\&quot; for multiple allowed values.  Use \&quot;;\&quot; for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format.  | [optional] 

### Return type

[**Array&lt;CustomerTimeline&gt;**](CustomerTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_customer_timeline**
> CustomerTimeline post_customer_timeline(bodyid, opts)

Create a customer Timeline comment or custom defined event

Create a customer Timeline comment or custom defined event. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
body = RebillySdk::CustomerTimeline.new # CustomerTimeline | Customer Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a customer Timeline comment or custom defined event
  result = api_instance.post_customer_timeline(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->post_customer_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CustomerTimeline**](CustomerTimeline.md)| Customer Timeline resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomerTimeline**](CustomerTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_customer_timeline_custom_event_type**
> CustomerTimelineCustomEvent post_customer_timeline_custom_event_type(body, opts)

Create Customer Timeline custom event type

Create Customer Timeline custom event type. 

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

api_instance = RebillySdk::CustomersTimelineApi.new
body = RebillySdk::CustomerTimelineCustomEvent.new # CustomerTimelineCustomEvent | Customer Timeline Custom Event Type resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create Customer Timeline custom event type
  result = api_instance.post_customer_timeline_custom_event_type(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->post_customer_timeline_custom_event_type: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CustomerTimelineCustomEvent**](CustomerTimelineCustomEvent.md)| Customer Timeline Custom Event Type resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomerTimelineCustomEvent**](CustomerTimelineCustomEvent.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



