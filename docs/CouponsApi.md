# RebillySdk::CouponsApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_coupon**](CouponsApi.md#get_coupon) | **GET** /coupons/{id} | Retrieve a coupon
[**get_coupon_collection**](CouponsApi.md#get_coupon_collection) | **GET** /coupons | Retrieve a list of coupons
[**get_coupon_redemption**](CouponsApi.md#get_coupon_redemption) | **GET** /coupons-redemptions/{id} | Retrieve a coupon redemption with specified identifier string
[**get_coupon_redemption_collection**](CouponsApi.md#get_coupon_redemption_collection) | **GET** /coupons-redemptions | Retrieve a list of coupon redemptions
[**post_coupon**](CouponsApi.md#post_coupon) | **POST** /coupons | Create a coupon
[**post_coupon_expiration**](CouponsApi.md#post_coupon_expiration) | **POST** /coupons/{id}/expiration | Set a coupon&#x27;s expiration time
[**post_coupon_redemption**](CouponsApi.md#post_coupon_redemption) | **POST** /coupons-redemptions | Redeem a coupon
[**post_coupon_redemption_cancellation**](CouponsApi.md#post_coupon_redemption_cancellation) | **POST** /coupons-redemptions/{id}/cancel | Cancel a coupon redemption
[**put_coupon**](CouponsApi.md#put_coupon) | **PUT** /coupons/{id} | Create or update a coupon with predefined coupon ID

# **get_coupon**
> Coupon get_coupon(id, opts)

Retrieve a coupon

Retrieve a coupon with specified coupon ID string. 

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

api_instance = RebillySdk::CouponsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a coupon
  result = api_instance.get_coupon(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->get_coupon: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Coupon**](Coupon.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_coupon_collection**
> Array&lt;Coupon&gt; get_coupon_collection(opts)

Retrieve a list of coupons

Retrieve a list of coupons. 

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

api_instance = RebillySdk::CouponsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of coupons
  result = api_instance.get_coupon_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->get_coupon_collection: #{e}"
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

[**Array&lt;Coupon&gt;**](Coupon.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_coupon_redemption**
> CouponRedemption get_coupon_redemption(id, opts)

Retrieve a coupon redemption with specified identifier string

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

api_instance = RebillySdk::CouponsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a coupon redemption with specified identifier string
  result = api_instance.get_coupon_redemption(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->get_coupon_redemption: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CouponRedemption**](CouponRedemption.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_coupon_redemption_collection**
> Array&lt;CouponRedemption&gt; get_coupon_redemption_collection(opts)

Retrieve a list of coupon redemptions

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

api_instance = RebillySdk::CouponsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of coupon redemptions
  result = api_instance.get_coupon_redemption_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->get_coupon_redemption_collection: #{e}"
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

[**Array&lt;CouponRedemption&gt;**](CouponRedemption.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_coupon**
> Coupon post_coupon(body, opts)

Create a coupon

Create a coupon. 

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

api_instance = RebillySdk::CouponsApi.new
body = RebillySdk::Coupon.new # Coupon | Coupon resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a coupon
  result = api_instance.post_coupon(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->post_coupon: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Coupon**](Coupon.md)| Coupon resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Coupon**](Coupon.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_coupon_expiration**
> Coupon post_coupon_expiration(id, opts)

Set a coupon's expiration time

Set a coupon's expiry time with the specified coupon ID. The expiredTime of a coupon must be greater than its issuedTime. This cannot be performed on expired coupons. 

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

api_instance = RebillySdk::CouponsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  body: RebillySdk::CouponExpiration.new # CouponExpiration | Coupon resource.
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Set a coupon's expiration time
  result = api_instance.post_coupon_expiration(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->post_coupon_expiration: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **body** | [**CouponExpiration**](CouponExpiration.md)| Coupon resource. | [optional] 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Coupon**](Coupon.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_coupon_redemption**
> CouponRedemption post_coupon_redemption(body, opts)

Redeem a coupon

Redeem a coupon. 

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

api_instance = RebillySdk::CouponsApi.new
body = RebillySdk::CouponRedemption.new # CouponRedemption | Redeem a coupon.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Redeem a coupon
  result = api_instance.post_coupon_redemption(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->post_coupon_redemption: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CouponRedemption**](CouponRedemption.md)| Redeem a coupon. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CouponRedemption**](CouponRedemption.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_coupon_redemption_cancellation**
> post_coupon_redemption_cancellation(id, opts)

Cancel a coupon redemption

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

api_instance = RebillySdk::CouponsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Cancel a coupon redemption
  api_instance.post_coupon_redemption_cancellation(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->post_coupon_redemption_cancellation: #{e}"
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



# **put_coupon**
> Coupon put_coupon(bodyid, opts)

Create or update a coupon with predefined coupon ID

Create or update a coupon with predefined coupon ID. 

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

api_instance = RebillySdk::CouponsApi.new
body = RebillySdk::Coupon.new # Coupon | Coupon resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update a coupon with predefined coupon ID
  result = api_instance.put_coupon(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->put_coupon: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Coupon**](Coupon.md)| Coupon resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Coupon**](Coupon.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



