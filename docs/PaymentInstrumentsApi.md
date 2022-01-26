# RebillySdk::PaymentInstrumentsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_payment_instrument**](PaymentInstrumentsApi.md#get_payment_instrument) | **GET** /payment-instruments/{id} | Retrieve a Payment Instrument
[**get_payment_instrument_collection**](PaymentInstrumentsApi.md#get_payment_instrument_collection) | **GET** /payment-instruments | Retrieve a list of payment instruments
[**patch_payment_instrument**](PaymentInstrumentsApi.md#patch_payment_instrument) | **PATCH** /payment-instruments/{id} | Update a Payment Instrument&#x27;s values
[**post_payment_instrument**](PaymentInstrumentsApi.md#post_payment_instrument) | **POST** /payment-instruments | Create a Payment Instrument
[**post_payment_instrument_deactivation**](PaymentInstrumentsApi.md#post_payment_instrument_deactivation) | **POST** /payment-instruments/{id}/deactivation | Deactivate a payment instrument

# **get_payment_instrument**
> PaymentInstrument2 get_payment_instrument(id, opts)

Retrieve a Payment Instrument

Retrieve a payment instrument by ID. 

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

api_instance = RebillySdk::PaymentInstrumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a Payment Instrument
  result = api_instance.get_payment_instrument(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->get_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**PaymentInstrument2**](PaymentInstrument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_payment_instrument_collection**
> Array&lt;PaymentInstrument2&gt; get_payment_instrument_collection(opts)

Retrieve a list of payment instruments

Retrieve a list of payment instruments. 

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

api_instance = RebillySdk::PaymentInstrumentsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example', # String | The partial search of the text fields.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a list of payment instruments
  result = api_instance.get_payment_instrument_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->get_payment_instrument_collection: #{e}"
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
 **expand** | **String**| Expand a response to get a full related object included inside of the &#x60;_embedded&#x60; path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info.  | [optional] 

### Return type

[**Array&lt;PaymentInstrument2&gt;**](PaymentInstrument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **patch_payment_instrument**
> PaymentInstrument2 patch_payment_instrument(bodyid, opts)

Update a Payment Instrument's values

Update allowed payment instrument's values.

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

api_instance = RebillySdk::PaymentInstrumentsApi.new
body = RebillySdk::null.new #  | PaymentInstrument resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a Payment Instrument's values
  result = api_instance.patch_payment_instrument(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->patch_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [****](.md)| PaymentInstrument resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**PaymentInstrument2**](PaymentInstrument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_payment_instrument**
> PaymentInstrument2 post_payment_instrument(body, opts)

Create a Payment Instrument

Create a payment instrument. If such payment card, bank account or alternative payment instrument already exists then it is updated instead. 

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

api_instance = RebillySdk::PaymentInstrumentsApi.new
body = RebillySdk::null.new #  | PaymentInstrument resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a Payment Instrument
  result = api_instance.post_payment_instrument(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->post_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [****](.md)| PaymentInstrument resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**PaymentInstrument2**](PaymentInstrument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_payment_instrument_deactivation**
> PaymentInstrument2 post_payment_instrument_deactivation(id, opts)

Deactivate a payment instrument

Deactivate a payment instrument. 

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

api_instance = RebillySdk::PaymentInstrumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Deactivate a payment instrument
  result = api_instance.post_payment_instrument_deactivation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->post_payment_instrument_deactivation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**PaymentInstrument2**](PaymentInstrument2.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



