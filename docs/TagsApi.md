# RebillySdk::TagsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_tag**](TagsApi.md#delete_tag) | **DELETE** /tags/{tag} | Delete a tag
[**delete_tag_customer**](TagsApi.md#delete_tag_customer) | **DELETE** /tags/{tag}/customers/{customerId} | Untag a customer
[**delete_tag_customer_collection**](TagsApi.md#delete_tag_customer_collection) | **DELETE** /tags/{tag}/customers | Untag a list of customers
[**delete_tag_kyc_document**](TagsApi.md#delete_tag_kyc_document) | **DELETE** /tags/{tag}/kyc-documents/{kycDocumentId} | Untag a kyc document
[**delete_tag_kyc_document_collection**](TagsApi.md#delete_tag_kyc_document_collection) | **DELETE** /tags/{tag}/kyc-documents | Untag a list of kyc documents
[**get_tag**](TagsApi.md#get_tag) | **GET** /tags/{tag} | Retrieve a tag
[**get_tag_collection**](TagsApi.md#get_tag_collection) | **GET** /tags | Retrieve a list of tags
[**patch_tag**](TagsApi.md#patch_tag) | **PATCH** /tags/{tag} | Update a tag
[**post_tag**](TagsApi.md#post_tag) | **POST** /tags | Create a tag
[**post_tag_customer**](TagsApi.md#post_tag_customer) | **POST** /tags/{tag}/customers/{customerId} | Tag a customer
[**post_tag_customer_collection**](TagsApi.md#post_tag_customer_collection) | **POST** /tags/{tag}/customers | Tag a list of customers
[**post_tag_kyc_document**](TagsApi.md#post_tag_kyc_document) | **POST** /tags/{tag}/kyc-documents/{kycDocumentId} | Tag a kyc document
[**post_tag_kyc_document_collection**](TagsApi.md#post_tag_kyc_document_collection) | **POST** /tags/{tag}/kyc-documents | Tag a list of kyc documents

# **delete_tag**
> delete_tag(tag, opts)

Delete a tag

Delete a tag. It's an asynchronous operation. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a tag
  api_instance.delete_tag(tag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_tag_customer**
> delete_tag_customer(tag, customer_id, opts)

Untag a customer

Untag a customer. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
customer_id = 'customer_id_example' # String | The customer identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Untag a customer
  api_instance.delete_tag_customer(tag, customer_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **customer_id** | **String**| The customer identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_tag_customer_collection**
> delete_tag_customer_collection(bodytag, opts)

Untag a list of customers

Untag a list of customers. If the customer from the list is already untagged it will be ignored. It's an asynchronous operation. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::TagCustomersBody1.new # TagCustomersBody1 | 
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Untag a list of customers
  api_instance.delete_tag_customer_collection(bodytag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_customer_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TagCustomersBody1**](TagCustomersBody1.md)|  | 
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_tag_kyc_document**
> delete_tag_kyc_document(tag, kyc_document_id, opts)

Untag a kyc document

Untag a kyc document. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
kyc_document_id = 'kyc_document_id_example' # String | The kyc document identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Untag a kyc document
  api_instance.delete_tag_kyc_document(tag, kyc_document_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_kyc_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **kyc_document_id** | **String**| The kyc document identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_tag_kyc_document_collection**
> delete_tag_kyc_document_collection(bodytag, opts)

Untag a list of kyc documents

Untag a list of kyc documents. If the kyc document from the list is already untagged it will be ignored. It's an asynchronous operation. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::TagKycdocumentsBody1.new # TagKycdocumentsBody1 | 
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Untag a list of kyc documents
  api_instance.delete_tag_kyc_document_collection(bodytag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_kyc_document_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TagKycdocumentsBody1**](TagKycdocumentsBody1.md)|  | 
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_tag**
> Tag get_tag(tag, opts)

Retrieve a tag

Retrieve a tag. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a tag
  result = api_instance.get_tag(tag, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->get_tag: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Tag**](Tag.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_tag_collection**
> Array&lt;Tag&gt; get_tag_collection(opts)

Retrieve a list of tags

Retrieve a list of tags. 

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

api_instance = RebillySdk::TagsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of tags
  result = api_instance.get_tag_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->get_tag_collection: #{e}"
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

### Return type

[**Array&lt;Tag&gt;**](Tag.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **patch_tag**
> Tag patch_tag(bodytag, opts)

Update a tag

Update a tag. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::null.new #  | Tag resource.
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a tag
  result = api_instance.patch_tag(bodytag, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->patch_tag: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [****](.md)| Tag resource. | 
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Tag**](Tag.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_tag**
> Tag post_tag(body, opts)

Create a tag

Create a tag. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::Tag.new # Tag | Tag resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a tag
  result = api_instance.post_tag(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Tag**](Tag.md)| Tag resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Tag**](Tag.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_tag_customer**
> post_tag_customer(tag, customer_id, opts)

Tag a customer

Tag a customer. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
customer_id = 'customer_id_example' # String | The customer identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Tag a customer
  api_instance.post_tag_customer(tag, customer_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **customer_id** | **String**| The customer identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_tag_customer_collection**
> post_tag_customer_collection(bodytag, opts)

Tag a list of customers

Tag a list of customers. If the customer from the list is already tagged it will be ignored. It's an asynchronous operation. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::TagCustomersBody.new # TagCustomersBody | 
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Tag a list of customers
  api_instance.post_tag_customer_collection(bodytag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_customer_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TagCustomersBody**](TagCustomersBody.md)|  | 
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_tag_kyc_document**
> post_tag_kyc_document(tag, kyc_document_id, opts)

Tag a kyc document

Tag a kyc document. 

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

api_instance = RebillySdk::TagsApi.new
tag = 'tag_example' # String | The tag name.
kyc_document_id = 'kyc_document_id_example' # String | The kyc document identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Tag a kyc document
  api_instance.post_tag_kyc_document(tag, kyc_document_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_kyc_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | **String**| The tag name. | 
 **kyc_document_id** | **String**| The kyc document identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_tag_kyc_document_collection**
> post_tag_kyc_document_collection(bodytag, opts)

Tag a list of kyc documents

Tag a list of kyc documents. If the kyc document from the list is already tagged it will be ignored. It's an asynchronous operation. 

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

api_instance = RebillySdk::TagsApi.new
body = RebillySdk::TagKycdocumentsBody.new # TagKycdocumentsBody | 
tag = 'tag_example' # String | The tag name.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Tag a list of kyc documents
  api_instance.post_tag_kyc_document_collection(bodytag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_kyc_document_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TagKycdocumentsBody**](TagKycdocumentsBody.md)|  | 
 **tag** | **String**| The tag name. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



