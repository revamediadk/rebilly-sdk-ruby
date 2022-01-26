# RebillySdk::CustomFieldsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_custom_field**](CustomFieldsApi.md#get_custom_field) | **GET** /custom-fields/{resource}/{name} | Retrieve a Custom Field
[**get_custom_field_collection**](CustomFieldsApi.md#get_custom_field_collection) | **GET** /custom-fields/{resource} | Retrieve Custom Fields
[**put_custom_field**](CustomFieldsApi.md#put_custom_field) | **PUT** /custom-fields/{resource}/{name} | Create or alter a Custom Field

# **get_custom_field**
> CustomField get_custom_field(resource, name, opts)

Retrieve a Custom Field

Retrieve a schema of the given Custom Field for the given resource type. 

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

api_instance = RebillySdk::CustomFieldsApi.new
resource = 'resource_example' # String | The resource type string.
name = 'name_example' # String | The custom field's identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a Custom Field
  result = api_instance.get_custom_field(resource, name, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomFieldsApi->get_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**| The resource type string. | 
 **name** | **String**| The custom field&#x27;s identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomField**](CustomField.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_custom_field_collection**
> Array&lt;CustomField&gt; get_custom_field_collection(resource, opts)

Retrieve Custom Fields

Retrieve a schema of Custom Fields for the given resource type. 

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

api_instance = RebillySdk::CustomFieldsApi.new
resource = 'resource_example' # String | The resource type string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve Custom Fields
  result = api_instance.get_custom_field_collection(resource, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomFieldsApi->get_custom_field_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**| The resource type string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 

### Return type

[**Array&lt;CustomField&gt;**](CustomField.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **put_custom_field**
> CustomField put_custom_field(bodyresourcename, opts)

Create or alter a Custom Field

Create or alter a schema of the given Custom Field for the given resource. type. 

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

api_instance = RebillySdk::CustomFieldsApi.new
body = RebillySdk::CustomField.new # CustomField | Custom Fields schema of the given resource type.
resource = 'resource_example' # String | The resource type string.
name = 'name_example' # String | The custom field's identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or alter a Custom Field
  result = api_instance.put_custom_field(bodyresourcename, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomFieldsApi->put_custom_field: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CustomField**](CustomField.md)| Custom Fields schema of the given resource type. | 
 **resource** | **String**| The resource type string. | 
 **name** | **String**| The custom field&#x27;s identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomField**](CustomField.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



