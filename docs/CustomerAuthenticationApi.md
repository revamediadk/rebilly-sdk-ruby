# RebillySdk::CustomerAuthenticationApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_authentication_token**](CustomerAuthenticationApi.md#delete_authentication_token) | **DELETE** /authentication-tokens/{token} | Logout a customer
[**delete_credential**](CustomerAuthenticationApi.md#delete_credential) | **DELETE** /credentials/{id} | Delete a credential
[**delete_password_token**](CustomerAuthenticationApi.md#delete_password_token) | **DELETE** /password-tokens/{id} | Delete a Reset Password Token
[**get_authentication_option**](CustomerAuthenticationApi.md#get_authentication_option) | **GET** /authentication-options | Read current authentication options
[**get_authentication_token_collection**](CustomerAuthenticationApi.md#get_authentication_token_collection) | **GET** /authentication-tokens | Retrieve a list of auth tokens
[**get_authentication_token_verification**](CustomerAuthenticationApi.md#get_authentication_token_verification) | **GET** /authentication-tokens/{token} | Verify
[**get_credential**](CustomerAuthenticationApi.md#get_credential) | **GET** /credentials/{id} | Retrieve a credential
[**get_credential_collection**](CustomerAuthenticationApi.md#get_credential_collection) | **GET** /credentials | Retrieve a list of credentials
[**get_password_token**](CustomerAuthenticationApi.md#get_password_token) | **GET** /password-tokens/{id} | Retrieve a Reset Password Token
[**get_password_token_collection**](CustomerAuthenticationApi.md#get_password_token_collection) | **GET** /password-tokens | Retrieve a list of tokens
[**post_authentication_token**](CustomerAuthenticationApi.md#post_authentication_token) | **POST** /authentication-tokens | Login
[**post_authentication_token_exchange**](CustomerAuthenticationApi.md#post_authentication_token_exchange) | **POST** /authentication-tokens/{token}/exchange | Exchange
[**post_credential**](CustomerAuthenticationApi.md#post_credential) | **POST** /credentials | Create a credential
[**post_password_token**](CustomerAuthenticationApi.md#post_password_token) | **POST** /password-tokens | Create a Reset Password Token
[**put_authentication_option**](CustomerAuthenticationApi.md#put_authentication_option) | **PUT** /authentication-options | Change authentication options
[**put_credential**](CustomerAuthenticationApi.md#put_credential) | **PUT** /credentials/{id} | Create or update a credential with predefined ID

# **delete_authentication_token**
> delete_authentication_token(token, opts)

Logout a customer

Logout a customer. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
token = 'token_example' # String | The token identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Logout a customer
  api_instance.delete_authentication_token(token, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->delete_authentication_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| The token identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

nil (empty response body)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_credential**
> delete_credential(id, opts)

Delete a credential

Delete a credential with predefined identifier string. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a credential
  api_instance.delete_credential(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->delete_credential: #{e}"
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



# **delete_password_token**
> delete_password_token(id, opts)

Delete a Reset Password Token

Delete a Reset Password Token with predefined identifier string. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Reset Password Token
  api_instance.delete_password_token(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->delete_password_token: #{e}"
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



# **get_authentication_option**
> Array&lt;AuthenticationOptions&gt; get_authentication_option(opts)

Read current authentication options

Read current authentication options. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Read current authentication options
  result = api_instance.get_authentication_option(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_authentication_option: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Array&lt;AuthenticationOptions&gt;**](AuthenticationOptions.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_authentication_token_collection**
> Array&lt;AuthenticationToken&gt; get_authentication_token_collection(opts)

Retrieve a list of auth tokens

Retrieve a list of auth tokens. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve a list of auth tokens
  result = api_instance.get_authentication_token_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_authentication_token_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 

### Return type

[**Array&lt;AuthenticationToken&gt;**](AuthenticationToken.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_authentication_token_verification**
> AuthenticationToken get_authentication_token_verification(token, opts)

Verify

Verify an authentication token. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
token = 'token_example' # String | The token identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Verify
  result = api_instance.get_authentication_token_verification(token, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_authentication_token_verification: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| The token identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**AuthenticationToken**](AuthenticationToken.md)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_credential**
> Credential get_credential(id, opts)

Retrieve a credential

Retrieve a credential with specified identifier string. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a credential
  result = api_instance.get_credential(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_credential: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Credential**](Credential.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_credential_collection**
> Array&lt;Credential&gt; get_credential_collection(opts)

Retrieve a list of credentials

Retrieve a list of credentials. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve a list of credentials
  result = api_instance.get_credential_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_credential_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 

### Return type

[**Array&lt;Credential&gt;**](Credential.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_password_token**
> ResetPasswordToken get_password_token(id, opts)

Retrieve a Reset Password Token

Retrieve a Reset Password Token with specified identifier string. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a Reset Password Token
  result = api_instance.get_password_token(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_password_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**ResetPasswordToken**](ResetPasswordToken.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_password_token_collection**
> Array&lt;ResetPasswordToken&gt; get_password_token_collection(opts)

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve a list of tokens
  result = api_instance.get_password_token_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->get_password_token_collection: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **limit** | **Integer**| The collection items limit. | [optional] 
 **offset** | **Integer**| The collection items offset. | [optional] 

### Return type

[**Array&lt;ResetPasswordToken&gt;**](ResetPasswordToken.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **post_authentication_token**
> AuthenticationToken post_authentication_token(body, opts)

Login

Login a customer. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::AuthenticationToken.new # AuthenticationToken | AuthenticationToken resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Login
  result = api_instance.post_authentication_token(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->post_authentication_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AuthenticationToken**](AuthenticationToken.md)| AuthenticationToken resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**AuthenticationToken**](AuthenticationToken.md)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_authentication_token_exchange**
> CustomerJWT post_authentication_token_exchange(bodytoken, opts)

Exchange

Exchange Authentication Token for JWT.  It will also invalidate an Authentication Token by default (so it can only be exchanged once). 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::CustomerJWT.new # CustomerJWT | 
token = 'token_example' # String | The token identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Exchange
  result = api_instance.post_authentication_token_exchange(bodytoken, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->post_authentication_token_exchange: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CustomerJWT**](CustomerJWT.md)|  | 
 **token** | **String**| The token identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**CustomerJWT**](CustomerJWT.md)

### Authorization

[JWT](../README.md#JWT), [PublishableApiKey](../README.md#PublishableApiKey), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_credential**
> Credential post_credential(body, opts)

Create a credential

Create a credential. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::Credential.new # Credential | Credential resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a credential
  result = api_instance.post_credential(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->post_credential: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Credential**](Credential.md)| Credential resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Credential**](Credential.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_password_token**
> ResetPasswordToken post_password_token(body, opts)

Create a Reset Password Token

Create a Reset Password Token. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::ResetPasswordToken.new # ResetPasswordToken | ResetPasswordToken resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a Reset Password Token
  result = api_instance.post_password_token(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->post_password_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ResetPasswordToken**](ResetPasswordToken.md)| ResetPasswordToken resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**ResetPasswordToken**](ResetPasswordToken.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_authentication_option**
> AuthenticationOptions put_authentication_option(body, opts)

Change authentication options

Change options. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::AuthenticationOptions.new # AuthenticationOptions | Authentication Options resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Change authentication options
  result = api_instance.put_authentication_option(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->put_authentication_option: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AuthenticationOptions**](AuthenticationOptions.md)| Authentication Options resource. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**AuthenticationOptions**](AuthenticationOptions.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_credential**
> Credential put_credential(bodyid, opts)

Create or update a credential with predefined ID

Create or update a credential with predefined identifier string. 

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

api_instance = RebillySdk::CustomerAuthenticationApi.new
body = RebillySdk::Credential.new # Credential | Credential resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update a credential with predefined ID
  result = api_instance.put_credential(bodyid, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->put_credential: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Credential**](Credential.md)| Credential resource. | 
 **id** | **String**| The resource identifier string. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 

### Return type

[**Credential**](Credential.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



