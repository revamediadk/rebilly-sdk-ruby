# RebillySdk::CustomersApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer**](CustomersApi.md#delete_customer) | **DELETE** /customers/{id} | Merge and delete a customer
[**delete_customer_lead_source**](CustomersApi.md#delete_customer_lead_source) | **DELETE** /customers/{id}/lead-source | Delete a Lead Source for a customer
[**get_customer**](CustomersApi.md#get_customer) | **GET** /customers/{id} | Retrieve a customer
[**get_customer_collection**](CustomersApi.md#get_customer_collection) | **GET** /customers | Retrieve a list of customers
[**get_customer_lead_source**](CustomersApi.md#get_customer_lead_source) | **GET** /customers/{id}/lead-source | Retrieve a customer&#x27;s Lead Source
[**post_customer**](CustomersApi.md#post_customer) | **POST** /customers | Create a customer (without an ID)
[**put_customer**](CustomersApi.md#put_customer) | **PUT** /customers/{id} | Upsert a customer with predefined ID
[**put_customer_lead_source**](CustomersApi.md#put_customer_lead_source) | **PUT** /customers/{id}/lead-source | Create a Lead Source for a customer

# **delete_customer**
> delete_customer(id, target_customer_id, opts)

Merge and delete a customer

Merge one duplicate customer to another target customer and delete the. former.

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

api_instance = RebillySdk::CustomersApi.new
id = 'id_example' # String | The resource identifier string.
target_customer_id = 'target_customer_id_example' # String | The customer identifier to get the data of the deleted duplicate customer.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Merge and delete a customer
  api_instance.delete_customer(id, target_customer_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->delete_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **target_customer_id** | **String**| The customer identifier to get the data of the deleted duplicate customer. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_customer_lead_source**
> delete_customer_lead_source(id, opts)

Delete a Lead Source for a customer

Delete a Lead Source that belongs to a certain customer. 

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

api_instance = RebillySdk::CustomersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Lead Source for a customer
  api_instance.delete_customer_lead_source(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->delete_customer_lead_source: #{e}"
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



# **get_customer**
> Customer get_customer(id, opts)

Retrieve a customer

Retrieve a customer with specified identifier string. 

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

api_instance = RebillySdk::CustomersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example', # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  fields: 'fields_example' # String | Limit the returned fields to the list specified, separated by comma. Note that id is always returned.
}

begin
  #Retrieve a customer
  result = api_instance.get_customer(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->get_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 
 **fields** | **String**| Limit the returned fields to the list specified, separated by comma. Note that id is always returned. | [optional] 

### Return type

[**Customer**](Customer.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_collection**
> Array&lt;Customer&gt; get_customer_collection(opts)

Retrieve a list of customers

Retrieve a list of customers. 

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

api_instance = RebillySdk::CustomersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  expand: 'expand_example', # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
  fields: 'fields_example', # String | Limit the returned fields to the list specified, separated by comma. Note that id is always returned.
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of customers
  result = api_instance.get_customer_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->get_customer_collection: #{e}"
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
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 
 **fields** | **String**| Limit the returned fields to the list specified, separated by comma. Note that id is always returned. | [optional] 
 **sort** | [**Array&lt;String&gt;**](String.md)| The collection items sort field and order (prefix with \&quot;-\&quot; for descending sort). | [optional] 

### Return type

[**Array&lt;Customer&gt;**](Customer.md)

### Authorization

[ApplicationJWT](../README.md#ApplicationJWT), [JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_customer_lead_source**
> LeadSource get_customer_lead_source(id, opts)

Retrieve a customer's Lead Source

Retrieve a Lead Source of given customer. 

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

api_instance = RebillySdk::CustomersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a customer's Lead Source
  result = api_instance.get_customer_lead_source(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->get_customer_lead_source: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**LeadSource**](LeadSource.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_customer**
> Customer post_customer(body, opts)

Create a customer (without an ID)

Create a customer without a predefined ID. The customer's primary address will be used as the default address for payment instruments, subscriptions and invoices if none are provided.  If you wish to create the customer with a predefined ID (which we recommend to prevent duplication), you may use our `PUT` request described below.  Read our guide to [preventing duplicates](https://api-guides.rebilly.com/core-concepts/preventing-duplicates) to understand more. 

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

api_instance = RebillySdk::CustomersApi.new
body = RebillySdk::Customer.new # Customer | Customer resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a customer (without an ID)
  result = api_instance.post_customer(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->post_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Customer**](Customer.md)| Customer resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Customer**](Customer.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_customer**
> Customer put_customer(bodyid, opts)

Upsert a customer with predefined ID

Create or update (upsert) a customer with predefined identifier string. Read our guide to [preventing duplicates](https://api-guides.rebilly.com/core-concepts/preventing-duplicates) to understand more. 

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

api_instance = RebillySdk::CustomersApi.new
body = RebillySdk::Customer.new # Customer | Customer resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Upsert a customer with predefined ID
  result = api_instance.put_customer(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->put_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Customer**](Customer.md)| Customer resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Customer**](Customer.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_customer_lead_source**
> LeadSource put_customer_lead_source(bodyid, opts)

Create a Lead Source for a customer

Create a Lead Source for a customer. 

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

api_instance = RebillySdk::CustomersApi.new
body = RebillySdk::LeadSource.new # LeadSource | Lead Source resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a Lead Source for a customer
  result = api_instance.put_customer_lead_source(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->put_customer_lead_source: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LeadSource**](LeadSource.md)| Lead Source resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**LeadSource**](LeadSource.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



