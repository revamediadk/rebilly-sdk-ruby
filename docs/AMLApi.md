# RebillySdk::AMLApi

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_aml_entry**](AMLApi.md#get_aml_entry) | **GET** /aml | Search PEP/Sanctions/Adverse Media lists

# **get_aml_entry**
> Array&lt;AML&gt; get_aml_entry(, , opts)

Search PEP/Sanctions/Adverse Media lists

Search multiple PEP/Sanctions/Adverse Media lists with first and last name to find any blocklisted identities. Performs a fuzzy search including soundex. Not all fields are guaranteed to be filled. 

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

api_instance = RebillySdk::AMLApi.new
 = RebillySdk::null.new #  | First name of individual to search.
 = RebillySdk::null.new #  | Last name of individual to search.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  : RebillySdk::null.new, #  | Date of birth in format YYYY-MM-DD.
  : RebillySdk::null.new #  | Country of individual as an ISO Alpha-2 code.
}

begin
  #Search PEP/Sanctions/Adverse Media lists
  result = api_instance.get_aml_entry(, , opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling AMLApi->get_aml_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **** | [****](.md)| First name of individual to search. | 
 **** | [****](.md)| Last name of individual to search. | 
 **organization_id** | [**ResourceId**](.md)| Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with &#x60;/organizations/{organizationId}&#x60; base path instead. | [optional] 
 **** | [****](.md)| Date of birth in format YYYY-MM-DD. | [optional] 
 **** | [****](.md)| Country of individual as an ISO Alpha-2 code. | [optional] 

### Return type

[**Array&lt;AML&gt;**](AML.md)

### Authorization

[JWT](../README.md#JWT), [SecretApiKey](../README.md#SecretApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



