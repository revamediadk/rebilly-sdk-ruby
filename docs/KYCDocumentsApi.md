# RebillySdk::KYCDocumentsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_kyc_request**](KYCDocumentsApi.md#delete_kyc_request) | **DELETE** /kyc-requests/{id} | Delete the KYC request
[**get_kyc_document**](KYCDocumentsApi.md#get_kyc_document) | **GET** /kyc-documents/{id} | Retrieve a KYC Document
[**get_kyc_document_collection**](KYCDocumentsApi.md#get_kyc_document_collection) | **GET** /kyc-documents | Retrieve a list of KYC documents
[**get_kyc_request**](KYCDocumentsApi.md#get_kyc_request) | **GET** /kyc-requests/{id} | Retrieve a KYC request
[**get_kyc_request_collection**](KYCDocumentsApi.md#get_kyc_request_collection) | **GET** /kyc-requests | Retrieve a list of KYC requests
[**patch_kyc_request**](KYCDocumentsApi.md#patch_kyc_request) | **PATCH** /kyc-requests/{id} | Update a KYC request
[**post_kyc_document**](KYCDocumentsApi.md#post_kyc_document) | **POST** /kyc-documents | Create a KYC Document
[**post_kyc_document_acceptance**](KYCDocumentsApi.md#post_kyc_document_acceptance) | **POST** /kyc-documents/{id}/acceptance | Accept a KYC document
[**post_kyc_document_matches**](KYCDocumentsApi.md#post_kyc_document_matches) | **POST** /kyc-documents/{id}/matches | Update a KYC document&#x27;s documentMatches
[**post_kyc_document_rejection**](KYCDocumentsApi.md#post_kyc_document_rejection) | **POST** /kyc-documents/{id}/rejection | Reject a KYC document
[**post_kyc_document_review**](KYCDocumentsApi.md#post_kyc_document_review) | **POST** /kyc-documents/{id}/review | Review a KYC document
[**post_kyc_document_start_review**](KYCDocumentsApi.md#post_kyc_document_start_review) | **POST** /kyc-documents/{id}/start-review | Start review for a KYC document
[**post_kyc_document_stop_review**](KYCDocumentsApi.md#post_kyc_document_stop_review) | **POST** /kyc-documents/{id}/stop-review | Stop review for a KYC document
[**post_kyc_request**](KYCDocumentsApi.md#post_kyc_request) | **POST** /kyc-requests | Create a KYC Request
[**put_kyc_document**](KYCDocumentsApi.md#put_kyc_document) | **PUT** /kyc-documents/{id} | Create or update a KYC document with predefined ID

# **delete_kyc_request**
> delete_kyc_request(id, opts)

Delete the KYC request

Delete the KYC request with the predefined identifier string. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete the KYC request
  api_instance.delete_kyc_request(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->delete_kyc_request: #{e}"
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



# **get_kyc_document**
> KycDocument2 get_kyc_document(id, opts)

Retrieve a KYC Document

Retrieve a KYC document with specified identifier string.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a KYC Document
  result = api_instance.get_kyc_document(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->get_kyc_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_kyc_document_collection**
> Array&lt;KycDocument2&gt; get_kyc_document_collection(opts)

Retrieve a list of KYC documents

Retrieve a list of KYC documents. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of KYC documents
  result = api_instance.get_kyc_document_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->get_kyc_document_collection: #{e}"
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

[**Array&lt;KycDocument2&gt;**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_kyc_request**
> KycRequest get_kyc_request(id, opts)

Retrieve a KYC request

Retrieve a KYC request with specified identifier string.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a KYC request
  result = api_instance.get_kyc_request(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->get_kyc_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycRequest**](KycRequest.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_kyc_request_collection**
> Array&lt;KycRequest&gt; get_kyc_request_collection(opts)

Retrieve a list of KYC requests

Retrieve a list of KYC requests. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of KYC requests
  result = api_instance.get_kyc_request_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->get_kyc_request_collection: #{e}"
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

[**Array&lt;KycRequest&gt;**](KycRequest.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **patch_kyc_request**
> KycRequest patch_kyc_request(id, opts)

Update a KYC request

Update a KYC request.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  body: RebillySdk::null.new #  | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a KYC request
  result = api_instance.patch_kyc_request(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->patch_kyc_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **body** | [****](.md)|  | [optional] 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycRequest**](KycRequest.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_kyc_document**
> KycDocument2 post_kyc_document(body, opts)

Create a KYC Document

Create a KYC Document. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
body = RebillySdk::KycDocument2.new # KycDocument2 | Kyc document resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a KYC Document
  result = api_instance.post_kyc_document(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**KycDocument2**](KycDocument2.md)| Kyc document resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_kyc_document_acceptance**
> KycDocument2 post_kyc_document_acceptance(id, opts)

Accept a KYC document

Marks that status of the document as `accepted`. Updates the review time and reviewer information. Intended to be used for manual overrides. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Accept a KYC document
  result = api_instance.post_kyc_document_acceptance(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_acceptance: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_kyc_document_matches**
> post_kyc_document_matches(bodyid, opts)

Update a KYC document's documentMatches

Updates a KYC document's documentMatches. Intended to be used for manual overrides. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
body = RebillySdk::IdMatchesBody.new # IdMatchesBody | Kyc document resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a KYC document's documentMatches
  api_instance.post_kyc_document_matches(bodyid, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_matches: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**IdMatchesBody**](IdMatchesBody.md)| Kyc document resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_kyc_document_rejection**
> KycDocument2 post_kyc_document_rejection(bodyid, opts)

Reject a KYC document

Marks that status of the document as `rejected`. Updates the review time and reviewer information. Intended to be used for manual overrides. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
body = RebillySdk::KycDocumentRejection.new # KycDocumentRejection | KYC document resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Reject a KYC document
  result = api_instance.post_kyc_document_rejection(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_rejection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**KycDocumentRejection**](KycDocumentRejection.md)| KYC document resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_kyc_document_review**
> KycDocument2 post_kyc_document_review(id, opts)

Review a KYC document

Mark the KYC document as reviewed. Updates the review time and reviewer. information.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Review a KYC document
  result = api_instance.post_kyc_document_review(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_kyc_document_start_review**
> KycDocument2 post_kyc_document_start_review(id, opts)

Start review for a KYC document

Sets the KYC document `reviewStartTime` to the current date-time, along with the review information.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Start review for a KYC document
  result = api_instance.post_kyc_document_start_review(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_start_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_kyc_document_stop_review**
> KycDocument2 post_kyc_document_stop_review(id, opts)

Stop review for a KYC document

Sets the KYC document `reviewStartTime` to null, along with the reviewer information to null too. Use this when the reviewer decides to stop, take a break, or ends a shift.

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

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Stop review for a KYC document
  result = api_instance.post_kyc_document_stop_review(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_stop_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_kyc_request**
> KycRequest post_kyc_request(body, opts)

Create a KYC Request

Create a KYC Request. 

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

api_instance = RebillySdk::KYCDocumentsApi.new
body = RebillySdk::KycRequest.new # KycRequest | Kyc request resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a KYC Request
  result = api_instance.post_kyc_request(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**KycRequest**](KycRequest.md)| Kyc request resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycRequest**](KycRequest.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_kyc_document**
> KycDocument2 put_kyc_document(bodyid, opts)

Create or update a KYC document with predefined ID

Create or update a KYC document with predefined identifier string.

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

api_instance = RebillySdk::KYCDocumentsApi.new
body = RebillySdk::KycDocument2.new # KycDocument2 | KYC document resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update a KYC document with predefined ID
  result = api_instance.put_kyc_document(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->put_kyc_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**KycDocument2**](KycDocument2.md)| KYC document resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**KycDocument2**](KycDocument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



