# RebillySdk::PaymentTokensApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_token**](PaymentTokensApi.md#get_token) | **GET** /tokens/{token} | Retrieve a token
[**get_token_collection**](PaymentTokensApi.md#get_token_collection) | **GET** /tokens | Retrieve a list of tokens
[**post_digital_wallet_validation**](PaymentTokensApi.md#post_digital_wallet_validation) | **POST** /digital-wallets/validation | Validate a digital wallet session
[**post_token**](PaymentTokensApi.md#post_token) | **POST** /tokens | Create a payment token

# **get_token**
> CompositeToken get_token(token, opts)

Retrieve a token

Retrieve a token with specified identifier string. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|
  # Configure API key authorization: PublishableApiKey
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'
end

api_instance = RebillySdk::PaymentTokensApi.new
token = 'token_example' # String | The token identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a token
  result = api_instance.get_token(token, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentTokensApi->get_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| The token identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CompositeToken**](CompositeToken.md)

### Authorization

[PublishableApiKey](../README.md#PublishableApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_token_collection**
> Array&lt;CompositeToken&gt; get_token_collection(opts)

Retrieve a list of tokens

Retrieve a list of tokens. 

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

api_instance = RebillySdk::PaymentTokensApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve a list of tokens
  result = api_instance.get_token_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentTokensApi->get_token_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 

### Return type

[**Array&lt;CompositeToken&gt;**](CompositeToken.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_digital_wallet_validation**
> DigitalWalletValidation post_digital_wallet_validation(body)

Validate a digital wallet session

[FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is the recommended way to use when validating a digital wallet session. 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: PublishableApiKey
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PaymentTokensApi.new
body = RebillySdk::DigitalWalletValidation.new # DigitalWalletValidation | Digital wallet validation request.


begin
  #Validate a digital wallet session
  result = api_instance.post_digital_wallet_validation(body)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentTokensApi->post_digital_wallet_validation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**DigitalWalletValidation**](DigitalWalletValidation.md)| Digital wallet validation request. | 

### Return type

[**DigitalWalletValidation**](DigitalWalletValidation.md)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_token**
> CompositeToken post_token(body, opts)

Create a payment token

[FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is the recommended way to create a payment token because it minimizes PCI DSS compliance.  Once a payment token is created, it can only be used once.  A payment token expires upon first use or within 30 minutes of the token creation (whichever comes first). 

### Example
```ruby
# load the gem
require 'rebilly_sdk'
# setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: PublishableApiKey
  config.api_key['Authorization'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['Authorization'] = 'Bearer'

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PaymentTokensApi.new
body = RebillySdk::CompositeToken.new # CompositeToken | PaymentToken resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a payment token
  result = api_instance.post_token(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentTokensApi->post_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CompositeToken**](CompositeToken.md)| PaymentToken resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CompositeToken**](CompositeToken.md)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



