# RebillySdk::InvoicesTimelineApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_invoice_timeline**](InvoicesTimelineApi.md#delete_invoice_timeline) | **DELETE** /invoices/{id}/timeline/{messageId} | Delete an Invoice Timeline message
[**get_invoice_timeline**](InvoicesTimelineApi.md#get_invoice_timeline) | **GET** /invoices/{id}/timeline/{messageId} | Retrieve an Invoice Timeline message
[**get_invoice_timeline_collection**](InvoicesTimelineApi.md#get_invoice_timeline_collection) | **GET** /invoices/{id}/timeline | Retrieve a list of invoice timeline messages
[**post_invoice_timeline**](InvoicesTimelineApi.md#post_invoice_timeline) | **POST** /invoices/{id}/timeline | Create an invoice Timeline comment

# **delete_invoice_timeline**
> delete_invoice_timeline(id, message_id, opts)

Delete an Invoice Timeline message

Delete an Invoice Timeline message with predefined identifier string. 

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

api_instance = RebillySdk::InvoicesTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Invoice Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete an Invoice Timeline message
  api_instance.delete_invoice_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesTimelineApi->delete_invoice_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Invoice Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_invoice_timeline**
> InvoiceTimeline get_invoice_timeline(id, message_id, opts)

Retrieve an Invoice Timeline message

Retrieve a invoice message with specified identifier string. 

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

api_instance = RebillySdk::InvoicesTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Invoice Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an Invoice Timeline message
  result = api_instance.get_invoice_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesTimelineApi->get_invoice_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **message_id** | **String**| The Invoice Timeline message ID. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**InvoiceTimeline**](InvoiceTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_invoice_timeline_collection**
> Array&lt;InvoiceTimeline&gt; get_invoice_timeline_collection(id, opts)

Retrieve a list of invoice timeline messages

Retrieve a list of invoice timeline messages. 

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

api_instance = RebillySdk::InvoicesTimelineApi.new
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
  #Retrieve a list of invoice timeline messages
  result = api_instance.get_invoice_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesTimelineApi->get_invoice_timeline_collection: #{e}"
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

[**Array&lt;InvoiceTimeline&gt;**](InvoiceTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_invoice_timeline**
> InvoiceTimeline post_invoice_timeline(bodyid, opts)

Create an invoice Timeline comment

Create an invoice Timeline comment. 

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

api_instance = RebillySdk::InvoicesTimelineApi.new
body = RebillySdk::InvoiceTimeline.new # InvoiceTimeline | Invoice Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an invoice Timeline comment
  result = api_instance.post_invoice_timeline(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesTimelineApi->post_invoice_timeline: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**InvoiceTimeline**](InvoiceTimeline.md)| Invoice Timeline resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**InvoiceTimeline**](InvoiceTimeline.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



