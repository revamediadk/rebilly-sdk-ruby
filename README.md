# rebilly_sdk

RebillySdk - the Ruby gem for the Rebilly REST API

# Introduction

The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.1
- Package version: 1.0.0
- Build package: io.swagger.codegen.v3.generators.ruby.RubyClientCodegen
For more information, please visit [https://www.rebilly.com/contact/](https://www.rebilly.com/contact/)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build rebilly_sdk.gemspec
```

Then either install the gem locally:

```shell
gem install ./rebilly_sdk-1.0.0.gem
```
(for development, run `gem install --dev ./rebilly_sdk-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'rebilly_sdk', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'rebilly_sdk', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'rebilly_sdk'
# Setup authorization
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
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::BlocklistsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a blocklist
  api_instance.delete_blocklist(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling BlocklistsApi->delete_blocklist: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::BlocklistsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a blocklist
  result = api_instance.get_blocklist(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling BlocklistsApi->get_blocklist: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::BlocklistsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of blocklists
  result = api_instance.get_blocklist_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling BlocklistsApi->get_blocklist_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::BlocklistsApi.new
body = RebillySdk::Blocklist.new # Blocklist | Blocklist resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a blocklist
  result = api_instance.post_blocklist(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling BlocklistsApi->post_blocklist: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::BlocklistsApi.new
body = RebillySdk::Blocklist.new # Blocklist | Blocklist resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a blocklist with predefined ID
  result = api_instance.put_blocklist(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling BlocklistsApi->put_blocklist: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CouponsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  body: RebillySdk::CouponExpiration.new, # CouponExpiration | Coupon resource.
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Set a coupon's expiration time
  result = api_instance.post_coupon_expiration(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->post_coupon_expiration: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.put_coupon(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CouponsApi->put_coupon: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.put_custom_field(body, resource, name, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomFieldsApi->put_custom_field: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.post_authentication_token_exchange(body, token, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->post_authentication_token_exchange: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.put_credential(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomerAuthenticationApi->put_credential: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.put_customer(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->put_customer: #{e}"
end
# Setup authorization
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
  result = api_instance.put_customer_lead_source(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersApi->put_customer_lead_source: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Customer Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Customer Timeline message
  api_instance.delete_customer_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->delete_customer_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Customer Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a customer Timeline message
  result = api_instance.get_customer_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
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
  #Retrieve a list of customer timeline messages
  result = api_instance.get_customer_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve customer timeline custom event type with specified identifier string
  result = api_instance.get_customer_timeline_custom_event_type(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_custom_event_type: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of customer timeline custom event types
  result = api_instance.get_customer_timeline_custom_event_type_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_custom_event_type_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of customer timeline messages for all customers
  result = api_instance.get_customer_timeline_event_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->get_customer_timeline_event_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
body = RebillySdk::CustomerTimeline.new # CustomerTimeline | Customer Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a customer Timeline comment or custom defined event
  result = api_instance.post_customer_timeline(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->post_customer_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::CustomersTimelineApi.new
body = RebillySdk::CustomerTimelineCustomEvent.new # CustomerTimelineCustomEvent | Customer Timeline Custom Event Type resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create Customer Timeline custom event type
  result = api_instance.post_customer_timeline_custom_event_type(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling CustomersTimelineApi->post_customer_timeline_custom_event_type: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::DisputesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a dispute
  result = api_instance.get_dispute(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling DisputesApi->get_dispute: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::DisputesApi.new
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
  #Retrieve a list of disputes
  result = api_instance.get_dispute_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling DisputesApi->get_dispute_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::DisputesApi.new
body = RebillySdk::Dispute.new # Dispute | Dispute resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a dispute
  result = api_instance.post_dispute(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling DisputesApi->post_dispute: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::DisputesApi.new
body = RebillySdk::Dispute.new # Dispute | Dispute resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update a Dispute with predefined ID
  result = api_instance.put_dispute(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling DisputesApi->put_dispute: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FeesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a fee entry
  result = api_instance.get_fee(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FeesApi->get_fee: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FeesApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Retrieve a list of Fees entries
  result = api_instance.get_fee_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FeesApi->get_fee_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FeesApi.new
body = RebillySdk::FeePatch.new # FeePatch | 
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Patch a fee entry
  result = api_instance.patch_fee(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FeesApi->patch_fee: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FeesApi.new
body = RebillySdk::Fee.new # Fee | 
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a fee entry
  result = api_instance.post_fee(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FeesApi->post_fee: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FeesApi.new
body = RebillySdk::Fee.new # Fee | 
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Upsert a fee entry
  result = api_instance.put_fee(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FeesApi->put_fee: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete an Attachment
  api_instance.delete_attachment(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->delete_attachment: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a File
  api_instance.delete_file(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->delete_file: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an Attachment
  result = api_instance.get_attachment(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_attachment: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
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
  #Retrieve a list of Attachments
  result = api_instance.get_attachment_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_attachment_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a File Record
  result = api_instance.get_file(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_file: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
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
  #Retrieve a list of files
  result = api_instance.get_file_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_file_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  image_size: 'image_size_example' # String | Resize image to specified size. Supports any sizes from 10x10 to 2000x2000 (format `{width}x{height}`). The image will be returned in the original size if the value is invalid. This parameter will be ignored for non-image files.
}

begin
  #Download a file
  result = api_instance.get_file_download(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_file_download: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
id = 'id_example' # String | The resource identifier string.
extension = 'extension_example' # String | File extension which also indicates the desired file format.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Download image in specific format
  result = api_instance.get_file_download_extension(id, extension, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->get_file_download_extension: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
body = RebillySdk::Attachment.new # Attachment | Attachment resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an Attachment
  result = api_instance.post_attachment(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->post_attachment: #{e}"
end
# Setup authorization
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

api_instance = RebillySdk::FilesApi.new
body = RebillySdk::FilesBody.new # FilesBody | 
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a file
  result = api_instance.post_file(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->post_file: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
body = RebillySdk::Attachment.new # Attachment | Attachment resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update the Attachment with predefined ID
  result = api_instance.put_attachment(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->put_attachment: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::FilesApi.new
body = File.new('/path/to/file') # File | File resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update the File with predefined ID
  result = api_instance.put_file(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling FilesApi->put_file: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
item_id = 'item_id_example' # String | The invoice item ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete an invoice item
  api_instance.delete_invoice_item(id, item_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->delete_invoice_item: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve customer's upcoming invoices
  result = api_instance.get_customer_upcoming_invoice_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_customer_upcoming_invoice_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  accept: 'application/json', # String | The response media type.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve an invoice
  result = api_instance.get_invoice(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
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
  #Retrieve a list of invoices
  result = api_instance.get_invoice_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
item_id = 'item_id_example' # String | The invoice item ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Get an invoice item
  result = api_instance.get_invoice_item(id, item_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_item: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve invoice items
  result = api_instance.get_invoice_item_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_item_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56 # Integer | The collection items offset.
}

begin
  #Get transaction amounts allocated to an invoice
  result = api_instance.get_invoice_transaction_allocation_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_transaction_allocation_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::Invoice.new # Invoice | Invoice resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an invoice
  result = api_instance.post_invoice(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Abandon an invoice
  result = api_instance.post_invoice_abandonment(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_abandonment: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::InvoiceIssue.new # InvoiceIssue | InvoiceIssue resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Issue an invoice
  result = api_instance.post_invoice_issuance(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_issuance: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::InvoiceItem.new # InvoiceItem | InvoiceItem resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an invoice item
  result = api_instance.post_invoice_item(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_item: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Recalculate an invoice
  result = api_instance.post_invoice_recalculation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_recalculation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::InvoiceReissue.new # InvoiceReissue | InvoiceReissue resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Reissue an invoice
  result = api_instance.post_invoice_reissuance(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_reissuance: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::InvoiceTransaction.new # InvoiceTransaction | InvoiceTransaction resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Apply a transaction to an invoice
  result = api_instance.post_invoice_transaction(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_transaction: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Void an invoice
  result = api_instance.post_invoice_void(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->post_invoice_void: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::Invoice.new # Invoice | Invoice resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update an invoice with predefined ID
  result = api_instance.put_invoice(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->put_invoice: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::InvoicesApi.new
body = RebillySdk::InvoiceItem.new # InvoiceItem | InvoiceItem resource.
id = 'id_example' # String | The resource identifier string.
item_id = 'item_id_example' # String | The invoice item ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update an invoice item
  result = api_instance.put_invoice_item(body, id, item_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesApi->put_invoice_item: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.post_invoice_timeline(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling InvoicesTimelineApi->post_invoice_timeline: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::KYCDocumentsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  body: RebillySdk::null.new, #  | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a KYC request
  result = api_instance.patch_kyc_request(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->patch_kyc_request: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  api_instance.post_kyc_document_matches(body, id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_matches: #{e}"
end
# Setup authorization
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
  result = api_instance.post_kyc_document_rejection(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->post_kyc_document_rejection: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.put_kyc_document(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling KYCDocumentsApi->put_kyc_document: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a pending order
  api_instance.delete_subscription(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->delete_subscription: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a cancellation
  api_instance.delete_subscription_cancellation(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->delete_subscription_cancellation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve an order
  result = api_instance.get_subscription(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an order cancellation
  result = api_instance.get_subscription_cancellation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_cancellation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of cancellations
  result = api_instance.get_subscription_cancellation_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_cancellation_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example', # String | The partial search of the text fields.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a list of orders
  result = api_instance.get_subscription_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an order reactivation
  result = api_instance.get_subscription_reactivation(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_reactivation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'] # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
}

begin
  #Retrieve a list of reactivations
  result = api_instance.get_subscription_reactivation_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_reactivation_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve subscription order's upcoming invoice
  result = api_instance.get_subscription_upcoming_invoice_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->get_subscription_upcoming_invoice_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
opts = { 
  body: RebillySdk::OrderPreview.new, # OrderPreview | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Preview an order
  result = api_instance.post_preview_order(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_preview_order: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::Subscription.new # Subscription | Order resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Create an order
  result = api_instance.post_subscription(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionCancellation.new # SubscriptionCancellation | Cancellation resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Cancel an order
  result = api_instance.post_subscription_cancellation(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_cancellation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionInvoice.new # SubscriptionInvoice | Issue an interim invoice.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Issue an interim invoice for a subscription order
  result = api_instance.post_subscription_interim_invoice(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_interim_invoice: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionChange.new # SubscriptionChange | Change items request.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Change an order's items
  result = api_instance.post_subscription_items_change(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_items_change: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionReactivation.new # SubscriptionReactivation | Reactivation resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Reactivate an order
  result = api_instance.post_subscription_reactivation(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_reactivation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Void an order
  result = api_instance.post_subscription_void(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_subscription_void: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::InvoiceIssue.new # InvoiceIssue | InvoiceIssue resource.
id = 'id_example' # String | The resource identifier string.
invoice_id = 'invoice_id_example' # String | The Upcoming Invoice ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Issue an upcoming invoice for early pay
  result = api_instance.post_upcoming_invoice_issuance(body, id, invoice_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->post_upcoming_invoice_issuance: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::Subscription.new # Subscription | Order resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. To expand multiple objects, it accepts a comma-separated list of objects (example: `expand=recentInvoice,initialInvoice`). Available arguments are:   - recentInvoice   - initialInvoice   - customer   - website  See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Upsert an order with predefined ID
  result = api_instance.put_subscription(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->put_subscription: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersApi.new
body = RebillySdk::SubscriptionCancellation.new # SubscriptionCancellation | Cancellation resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Cancel an order
  result = api_instance.put_subscription_cancellation(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersApi->put_subscription_cancellation: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Order Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete an Order Timeline message
  api_instance.delete_subscription_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->delete_subscription_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Order Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve an Order Timeline message
  result = api_instance.get_subscription_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->get_subscription_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersTimelineApi.new
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
  #Retrieve a list of order timeline messages
  result = api_instance.get_subscription_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->get_subscription_timeline_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::OrdersTimelineApi.new
body = RebillySdk::OrderTimeline.new # OrderTimeline | Order Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create an order Timeline comment
  result = api_instance.post_subscription_timeline(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling OrdersTimelineApi->post_subscription_timeline: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.patch_payment_instrument(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->patch_payment_instrument: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PlansApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Plan
  api_instance.delete_plan(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling PlansApi->delete_plan: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PlansApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a plan
  result = api_instance.get_plan(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PlansApi->get_plan: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PlansApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of plans
  result = api_instance.get_plan_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PlansApi->get_plan_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PlansApi.new
body = RebillySdk::Plan.new # Plan | Plan resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a plan
  result = api_instance.post_plan(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PlansApi->post_plan: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::PlansApi.new
body = RebillySdk::Plan.new # Plan | Plan resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create or update a Plan with predefined ID
  result = api_instance.put_plan(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling PlansApi->put_plan: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ProductsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a product
  api_instance.delete_product(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling ProductsApi->delete_product: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ProductsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a product
  result = api_instance.get_product(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ProductsApi->get_product: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ProductsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of products
  result = api_instance.get_product_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ProductsApi->get_product_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ProductsApi.new
body = RebillySdk::Product.new # Product | Product resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a Product
  result = api_instance.post_product(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ProductsApi->post_product: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ProductsApi.new
body = RebillySdk::Product.new # Product | Product resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Upsert a product with predefined ID
  result = api_instance.put_product(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ProductsApi->put_product: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::SearchApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  q: 'q_example' # String | The default search. It will search across resources and many fields.
}

begin
  #Search merchant data
  result = api_instance.get_search(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling SearchApi->get_search: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingRatesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a shipping rate
  api_instance.delete_shipping_rate(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingRatesApi->delete_shipping_rate: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingRatesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a shipping rate
  result = api_instance.get_shipping_rate(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingRatesApi->get_shipping_rate: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingRatesApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of shipping rates
  result = api_instance.get_shipping_rate_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingRatesApi->get_shipping_rate_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingRatesApi.new
body = RebillySdk::ShippingRate.new # ShippingRate | Shipping rate resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a shipping rate
  result = api_instance.post_shipping_rate(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingRatesApi->post_shipping_rate: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingRatesApi.new
body = RebillySdk::ShippingRate.new # ShippingRate | Shipping rate resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a shipping rate with predefined ID
  result = api_instance.put_shipping_rate(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingRatesApi->put_shipping_rate: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingZonesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a shipping zone
  api_instance.delete_shipping_zone(id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingZonesApi->delete_shipping_zone: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingZonesApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a shipping zone
  result = api_instance.get_shipping_zone(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingZonesApi->get_shipping_zone: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingZonesApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  q: 'q_example' # String | The partial search of the text fields.
}

begin
  #Retrieve a list of shipping zones
  result = api_instance.get_shipping_zone_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingZonesApi->get_shipping_zone_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingZonesApi.new
body = RebillySdk::ShippingZone.new # ShippingZone | Shipping Zone resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a Shipping Zone
  result = api_instance.post_shipping_zone(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingZonesApi->post_shipping_zone: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::ShippingZonesApi.new
body = RebillySdk::ShippingZone.new # ShippingZone | Shipping zone resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a shipping zone with predefined ID
  result = api_instance.put_shipping_zone(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling ShippingZonesApi->put_shipping_zone: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  api_instance.delete_tag_customer_collection(body, tag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_customer_collection: #{e}"
end
# Setup authorization
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
# Setup authorization
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
  api_instance.delete_tag_kyc_document_collection(body, tag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->delete_tag_kyc_document_collection: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  result = api_instance.patch_tag(body, tag, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->patch_tag: #{e}"
end
# Setup authorization
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
# Setup authorization
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
# Setup authorization
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
  api_instance.post_tag_customer_collection(body, tag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_customer_collection: #{e}"
end
# Setup authorization
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
# Setup authorization
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
  api_instance.post_tag_kyc_document_collection(body, tag, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TagsApi->post_tag_kyc_document_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a Transaction
  result = api_instance.get_transaction(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->get_transaction: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example', # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
  q: 'q_example', # String | The partial search of the text fields.
  sort: ['sort_example'], # Array<String> | The collection items sort field and order (prefix with \"-\" for descending sort).
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Retrieve a list of transactions
  result = api_instance.get_transaction_collection(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->get_transaction_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = nil # Object | Use the patch transaction request to modify custom fields.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a transaction
  result = api_instance.patch_transaction(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->patch_transaction: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::PayoutRequest.new # PayoutRequest | Transaction resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a credit transaction
  result = api_instance.post_payout(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_payout: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
opts = { 
  body: RebillySdk::CoreReadyToPay.new, # CoreReadyToPay | 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Ready to Pay
  result = api_instance.post_ready_to_pay(opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_ready_to_pay: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|


  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionRequest.new # TransactionRequest | Transaction resource.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  expand: 'expand_example' # String | Expand a response to get a full related object included inside of the `_embedded` path in the response. It accepts a comma-separated list of objects to expand. See the [expand guide](https://api-reference.rebilly.com/#section/Expand-to-include-embedded-objects) for more info. 
}

begin
  #Create a transaction
  result = api_instance.post_transaction(body, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Query a Transaction
  result = api_instance.post_transaction_query(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_query: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionRefund.new # TransactionRefund | Transaction resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Refund a Transaction
  result = api_instance.post_transaction_refund(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_refund: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsApi.new
body = RebillySdk::TransactionUpdate.new # TransactionUpdate | 
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Update a Transaction status
  result = api_instance.post_transaction_update(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsApi->post_transaction_update: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Transaction Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Delete a Transaction Timeline message
  api_instance.delete_transaction_timeline(id, message_id, opts)
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->delete_transaction_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
message_id = 'message_id_example' # String | The Transaction Timeline message ID.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Retrieve a transaction Timeline message
  result = api_instance.get_transaction_timeline(id, message_id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->get_transaction_timeline: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsTimelineApi.new
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new, # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
  limit: 56, # Integer | The collection items limit.
  offset: 56, # Integer | The collection items offset.
  filter: 'filter_example' # String | The collection items filter requires a special format. Use \",\" for multiple allowed values.  Use \";\" for multiple fields. See the [filter guide](https://api-reference.rebilly.com/#section/Using-filter-with-collections) for more options and examples about this format. 
}

begin
  #Retrieve a list of transaction timeline messages
  result = api_instance.get_transaction_timeline_collection(id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->get_transaction_timeline_collection: #{e}"
end
# Setup authorization
RebillySdk.configure do |config|

  # Configure API key authorization: SecretApiKey
  config.api_key['REB-APIKEY'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['REB-APIKEY'] = 'Bearer'
end

api_instance = RebillySdk::TransactionsTimelineApi.new
body = RebillySdk::TransactionTimeline.new # TransactionTimeline | Transaction Timeline resource.
id = 'id_example' # String | The resource identifier string.
opts = { 
  organization_id: RebillySdk::ResourceId.new # ResourceId | Organization identifier in scope of which need to perform request (if not specified, the default organization will be used).  It is deprecated. Use servers with `/organizations/{organizationId}` base path instead.
}

begin
  #Create a transaction Timeline comment
  result = api_instance.post_transaction_timeline(body, id, opts)
  p result
rescue RebillySdk::ApiError => e
  puts "Exception when calling TransactionsTimelineApi->post_transaction_timeline: #{e}"
end
```

## Documentation for API Endpoints

All URIs are relative to *https://api-sandbox.rebilly.com/organizations/{organizationId}*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*RebillySdk::AMLApi* | [**get_aml_entry**](docs/AMLApi.md#get_aml_entry) | **GET** /aml | Search PEP/Sanctions/Adverse Media lists
*RebillySdk::BlocklistsApi* | [**delete_blocklist**](docs/BlocklistsApi.md#delete_blocklist) | **DELETE** /blocklists/{id} | Delete a blocklist
*RebillySdk::BlocklistsApi* | [**get_blocklist**](docs/BlocklistsApi.md#get_blocklist) | **GET** /blocklists/{id} | Retrieve a blocklist
*RebillySdk::BlocklistsApi* | [**get_blocklist_collection**](docs/BlocklistsApi.md#get_blocklist_collection) | **GET** /blocklists | Retrieve a list of blocklists
*RebillySdk::BlocklistsApi* | [**post_blocklist**](docs/BlocklistsApi.md#post_blocklist) | **POST** /blocklists | Create a blocklist
*RebillySdk::BlocklistsApi* | [**put_blocklist**](docs/BlocklistsApi.md#put_blocklist) | **PUT** /blocklists/{id} | Create a blocklist with predefined ID
*RebillySdk::CouponsApi* | [**get_coupon**](docs/CouponsApi.md#get_coupon) | **GET** /coupons/{id} | Retrieve a coupon
*RebillySdk::CouponsApi* | [**get_coupon_collection**](docs/CouponsApi.md#get_coupon_collection) | **GET** /coupons | Retrieve a list of coupons
*RebillySdk::CouponsApi* | [**get_coupon_redemption**](docs/CouponsApi.md#get_coupon_redemption) | **GET** /coupons-redemptions/{id} | Retrieve a coupon redemption with specified identifier string
*RebillySdk::CouponsApi* | [**get_coupon_redemption_collection**](docs/CouponsApi.md#get_coupon_redemption_collection) | **GET** /coupons-redemptions | Retrieve a list of coupon redemptions
*RebillySdk::CouponsApi* | [**post_coupon**](docs/CouponsApi.md#post_coupon) | **POST** /coupons | Create a coupon
*RebillySdk::CouponsApi* | [**post_coupon_expiration**](docs/CouponsApi.md#post_coupon_expiration) | **POST** /coupons/{id}/expiration | Set a coupon's expiration time
*RebillySdk::CouponsApi* | [**post_coupon_redemption**](docs/CouponsApi.md#post_coupon_redemption) | **POST** /coupons-redemptions | Redeem a coupon
*RebillySdk::CouponsApi* | [**post_coupon_redemption_cancellation**](docs/CouponsApi.md#post_coupon_redemption_cancellation) | **POST** /coupons-redemptions/{id}/cancel | Cancel a coupon redemption
*RebillySdk::CouponsApi* | [**put_coupon**](docs/CouponsApi.md#put_coupon) | **PUT** /coupons/{id} | Create or update a coupon with predefined coupon ID
*RebillySdk::CustomFieldsApi* | [**get_custom_field**](docs/CustomFieldsApi.md#get_custom_field) | **GET** /custom-fields/{resource}/{name} | Retrieve a Custom Field
*RebillySdk::CustomFieldsApi* | [**get_custom_field_collection**](docs/CustomFieldsApi.md#get_custom_field_collection) | **GET** /custom-fields/{resource} | Retrieve Custom Fields
*RebillySdk::CustomFieldsApi* | [**put_custom_field**](docs/CustomFieldsApi.md#put_custom_field) | **PUT** /custom-fields/{resource}/{name} | Create or alter a Custom Field
*RebillySdk::CustomerAuthenticationApi* | [**delete_authentication_token**](docs/CustomerAuthenticationApi.md#delete_authentication_token) | **DELETE** /authentication-tokens/{token} | Logout a customer
*RebillySdk::CustomerAuthenticationApi* | [**delete_credential**](docs/CustomerAuthenticationApi.md#delete_credential) | **DELETE** /credentials/{id} | Delete a credential
*RebillySdk::CustomerAuthenticationApi* | [**delete_password_token**](docs/CustomerAuthenticationApi.md#delete_password_token) | **DELETE** /password-tokens/{id} | Delete a Reset Password Token
*RebillySdk::CustomerAuthenticationApi* | [**get_authentication_option**](docs/CustomerAuthenticationApi.md#get_authentication_option) | **GET** /authentication-options | Read current authentication options
*RebillySdk::CustomerAuthenticationApi* | [**get_authentication_token_collection**](docs/CustomerAuthenticationApi.md#get_authentication_token_collection) | **GET** /authentication-tokens | Retrieve a list of auth tokens
*RebillySdk::CustomerAuthenticationApi* | [**get_authentication_token_verification**](docs/CustomerAuthenticationApi.md#get_authentication_token_verification) | **GET** /authentication-tokens/{token} | Verify
*RebillySdk::CustomerAuthenticationApi* | [**get_credential**](docs/CustomerAuthenticationApi.md#get_credential) | **GET** /credentials/{id} | Retrieve a credential
*RebillySdk::CustomerAuthenticationApi* | [**get_credential_collection**](docs/CustomerAuthenticationApi.md#get_credential_collection) | **GET** /credentials | Retrieve a list of credentials
*RebillySdk::CustomerAuthenticationApi* | [**get_password_token**](docs/CustomerAuthenticationApi.md#get_password_token) | **GET** /password-tokens/{id} | Retrieve a Reset Password Token
*RebillySdk::CustomerAuthenticationApi* | [**get_password_token_collection**](docs/CustomerAuthenticationApi.md#get_password_token_collection) | **GET** /password-tokens | Retrieve a list of tokens
*RebillySdk::CustomerAuthenticationApi* | [**post_authentication_token**](docs/CustomerAuthenticationApi.md#post_authentication_token) | **POST** /authentication-tokens | Login
*RebillySdk::CustomerAuthenticationApi* | [**post_authentication_token_exchange**](docs/CustomerAuthenticationApi.md#post_authentication_token_exchange) | **POST** /authentication-tokens/{token}/exchange | Exchange
*RebillySdk::CustomerAuthenticationApi* | [**post_credential**](docs/CustomerAuthenticationApi.md#post_credential) | **POST** /credentials | Create a credential
*RebillySdk::CustomerAuthenticationApi* | [**post_password_token**](docs/CustomerAuthenticationApi.md#post_password_token) | **POST** /password-tokens | Create a Reset Password Token
*RebillySdk::CustomerAuthenticationApi* | [**put_authentication_option**](docs/CustomerAuthenticationApi.md#put_authentication_option) | **PUT** /authentication-options | Change authentication options
*RebillySdk::CustomerAuthenticationApi* | [**put_credential**](docs/CustomerAuthenticationApi.md#put_credential) | **PUT** /credentials/{id} | Create or update a credential with predefined ID
*RebillySdk::CustomersApi* | [**delete_customer**](docs/CustomersApi.md#delete_customer) | **DELETE** /customers/{id} | Merge and delete a customer
*RebillySdk::CustomersApi* | [**delete_customer_lead_source**](docs/CustomersApi.md#delete_customer_lead_source) | **DELETE** /customers/{id}/lead-source | Delete a Lead Source for a customer
*RebillySdk::CustomersApi* | [**get_customer**](docs/CustomersApi.md#get_customer) | **GET** /customers/{id} | Retrieve a customer
*RebillySdk::CustomersApi* | [**get_customer_collection**](docs/CustomersApi.md#get_customer_collection) | **GET** /customers | Retrieve a list of customers
*RebillySdk::CustomersApi* | [**get_customer_lead_source**](docs/CustomersApi.md#get_customer_lead_source) | **GET** /customers/{id}/lead-source | Retrieve a customer's Lead Source
*RebillySdk::CustomersApi* | [**post_customer**](docs/CustomersApi.md#post_customer) | **POST** /customers | Create a customer (without an ID)
*RebillySdk::CustomersApi* | [**put_customer**](docs/CustomersApi.md#put_customer) | **PUT** /customers/{id} | Upsert a customer with predefined ID
*RebillySdk::CustomersApi* | [**put_customer_lead_source**](docs/CustomersApi.md#put_customer_lead_source) | **PUT** /customers/{id}/lead-source | Create a Lead Source for a customer
*RebillySdk::CustomersTimelineApi* | [**delete_customer_timeline**](docs/CustomersTimelineApi.md#delete_customer_timeline) | **DELETE** /customers/{id}/timeline/{messageId} | Delete a Customer Timeline message
*RebillySdk::CustomersTimelineApi* | [**get_customer_timeline**](docs/CustomersTimelineApi.md#get_customer_timeline) | **GET** /customers/{id}/timeline/{messageId} | Retrieve a customer Timeline message
*RebillySdk::CustomersTimelineApi* | [**get_customer_timeline_collection**](docs/CustomersTimelineApi.md#get_customer_timeline_collection) | **GET** /customers/{id}/timeline | Retrieve a list of customer timeline messages
*RebillySdk::CustomersTimelineApi* | [**get_customer_timeline_custom_event_type**](docs/CustomersTimelineApi.md#get_customer_timeline_custom_event_type) | **GET** /customer-timeline-custom-events/{id} | Retrieve customer timeline custom event type with specified identifier string
*RebillySdk::CustomersTimelineApi* | [**get_customer_timeline_custom_event_type_collection**](docs/CustomersTimelineApi.md#get_customer_timeline_custom_event_type_collection) | **GET** /customer-timeline-custom-events | Retrieve a list of customer timeline custom event types
*RebillySdk::CustomersTimelineApi* | [**get_customer_timeline_event_collection**](docs/CustomersTimelineApi.md#get_customer_timeline_event_collection) | **GET** /customer-timeline-events | Retrieve a list of customer timeline messages for all customers
*RebillySdk::CustomersTimelineApi* | [**post_customer_timeline**](docs/CustomersTimelineApi.md#post_customer_timeline) | **POST** /customers/{id}/timeline | Create a customer Timeline comment or custom defined event
*RebillySdk::CustomersTimelineApi* | [**post_customer_timeline_custom_event_type**](docs/CustomersTimelineApi.md#post_customer_timeline_custom_event_type) | **POST** /customer-timeline-custom-events | Create Customer Timeline custom event type
*RebillySdk::DisputesApi* | [**get_dispute**](docs/DisputesApi.md#get_dispute) | **GET** /disputes/{id} | Retrieve a dispute
*RebillySdk::DisputesApi* | [**get_dispute_collection**](docs/DisputesApi.md#get_dispute_collection) | **GET** /disputes | Retrieve a list of disputes
*RebillySdk::DisputesApi* | [**post_dispute**](docs/DisputesApi.md#post_dispute) | **POST** /disputes | Create a dispute
*RebillySdk::DisputesApi* | [**put_dispute**](docs/DisputesApi.md#put_dispute) | **PUT** /disputes/{id} | Create or update a Dispute with predefined ID
*RebillySdk::FeesApi* | [**get_fee**](docs/FeesApi.md#get_fee) | **GET** /fees/{id} | Retrieve a fee entry
*RebillySdk::FeesApi* | [**get_fee_collection**](docs/FeesApi.md#get_fee_collection) | **GET** /fees | Retrieve a list of Fees entries
*RebillySdk::FeesApi* | [**patch_fee**](docs/FeesApi.md#patch_fee) | **PATCH** /fees/{id} | Patch a fee entry
*RebillySdk::FeesApi* | [**post_fee**](docs/FeesApi.md#post_fee) | **POST** /fees | Create a fee entry
*RebillySdk::FeesApi* | [**put_fee**](docs/FeesApi.md#put_fee) | **PUT** /fees/{id} | Upsert a fee entry
*RebillySdk::FilesApi* | [**delete_attachment**](docs/FilesApi.md#delete_attachment) | **DELETE** /attachments/{id} | Delete an Attachment
*RebillySdk::FilesApi* | [**delete_file**](docs/FilesApi.md#delete_file) | **DELETE** /files/{id} | Delete a File
*RebillySdk::FilesApi* | [**get_attachment**](docs/FilesApi.md#get_attachment) | **GET** /attachments/{id} | Retrieve an Attachment
*RebillySdk::FilesApi* | [**get_attachment_collection**](docs/FilesApi.md#get_attachment_collection) | **GET** /attachments | Retrieve a list of Attachments
*RebillySdk::FilesApi* | [**get_file**](docs/FilesApi.md#get_file) | **GET** /files/{id} | Retrieve a File Record
*RebillySdk::FilesApi* | [**get_file_collection**](docs/FilesApi.md#get_file_collection) | **GET** /files | Retrieve a list of files
*RebillySdk::FilesApi* | [**get_file_download**](docs/FilesApi.md#get_file_download) | **GET** /files/{id}/download | Download a file
*RebillySdk::FilesApi* | [**get_file_download_extension**](docs/FilesApi.md#get_file_download_extension) | **GET** /files/{id}/download{extension} | Download image in specific format
*RebillySdk::FilesApi* | [**post_attachment**](docs/FilesApi.md#post_attachment) | **POST** /attachments | Create an Attachment
*RebillySdk::FilesApi* | [**post_file**](docs/FilesApi.md#post_file) | **POST** /files | Create a file
*RebillySdk::FilesApi* | [**put_attachment**](docs/FilesApi.md#put_attachment) | **PUT** /attachments/{id} | Update the Attachment with predefined ID
*RebillySdk::FilesApi* | [**put_file**](docs/FilesApi.md#put_file) | **PUT** /files/{id} | Update the File with predefined ID
*RebillySdk::InvoicesApi* | [**delete_invoice_item**](docs/InvoicesApi.md#delete_invoice_item) | **DELETE** /invoices/{id}/items/{itemId} | Delete an invoice item
*RebillySdk::InvoicesApi* | [**get_customer_upcoming_invoice_collection**](docs/InvoicesApi.md#get_customer_upcoming_invoice_collection) | **GET** /customers/{id}/upcoming-invoices | Retrieve customer's upcoming invoices
*RebillySdk::InvoicesApi* | [**get_invoice**](docs/InvoicesApi.md#get_invoice) | **GET** /invoices/{id} | Retrieve an invoice
*RebillySdk::InvoicesApi* | [**get_invoice_collection**](docs/InvoicesApi.md#get_invoice_collection) | **GET** /invoices | Retrieve a list of invoices
*RebillySdk::InvoicesApi* | [**get_invoice_item**](docs/InvoicesApi.md#get_invoice_item) | **GET** /invoices/{id}/items/{itemId} | Get an invoice item
*RebillySdk::InvoicesApi* | [**get_invoice_item_collection**](docs/InvoicesApi.md#get_invoice_item_collection) | **GET** /invoices/{id}/items | Retrieve invoice items
*RebillySdk::InvoicesApi* | [**get_invoice_transaction_allocation_collection**](docs/InvoicesApi.md#get_invoice_transaction_allocation_collection) | **GET** /invoices/{id}/transaction-allocations | Get transaction amounts allocated to an invoice
*RebillySdk::InvoicesApi* | [**post_invoice**](docs/InvoicesApi.md#post_invoice) | **POST** /invoices | Create an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_abandonment**](docs/InvoicesApi.md#post_invoice_abandonment) | **POST** /invoices/{id}/abandon | Abandon an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_issuance**](docs/InvoicesApi.md#post_invoice_issuance) | **POST** /invoices/{id}/issue | Issue an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_item**](docs/InvoicesApi.md#post_invoice_item) | **POST** /invoices/{id}/items | Create an invoice item
*RebillySdk::InvoicesApi* | [**post_invoice_recalculation**](docs/InvoicesApi.md#post_invoice_recalculation) | **POST** /invoices/{id}/recalculate | Recalculate an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_reissuance**](docs/InvoicesApi.md#post_invoice_reissuance) | **POST** /invoices/{id}/reissue | Reissue an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_transaction**](docs/InvoicesApi.md#post_invoice_transaction) | **POST** /invoices/{id}/transaction | Apply a transaction to an invoice
*RebillySdk::InvoicesApi* | [**post_invoice_void**](docs/InvoicesApi.md#post_invoice_void) | **POST** /invoices/{id}/void | Void an invoice
*RebillySdk::InvoicesApi* | [**put_invoice**](docs/InvoicesApi.md#put_invoice) | **PUT** /invoices/{id} | Create or update an invoice with predefined ID
*RebillySdk::InvoicesApi* | [**put_invoice_item**](docs/InvoicesApi.md#put_invoice_item) | **PUT** /invoices/{id}/items/{itemId} | Update an invoice item
*RebillySdk::InvoicesTimelineApi* | [**delete_invoice_timeline**](docs/InvoicesTimelineApi.md#delete_invoice_timeline) | **DELETE** /invoices/{id}/timeline/{messageId} | Delete an Invoice Timeline message
*RebillySdk::InvoicesTimelineApi* | [**get_invoice_timeline**](docs/InvoicesTimelineApi.md#get_invoice_timeline) | **GET** /invoices/{id}/timeline/{messageId} | Retrieve an Invoice Timeline message
*RebillySdk::InvoicesTimelineApi* | [**get_invoice_timeline_collection**](docs/InvoicesTimelineApi.md#get_invoice_timeline_collection) | **GET** /invoices/{id}/timeline | Retrieve a list of invoice timeline messages
*RebillySdk::InvoicesTimelineApi* | [**post_invoice_timeline**](docs/InvoicesTimelineApi.md#post_invoice_timeline) | **POST** /invoices/{id}/timeline | Create an invoice Timeline comment
*RebillySdk::KYCDocumentsApi* | [**delete_kyc_request**](docs/KYCDocumentsApi.md#delete_kyc_request) | **DELETE** /kyc-requests/{id} | Delete the KYC request
*RebillySdk::KYCDocumentsApi* | [**get_kyc_document**](docs/KYCDocumentsApi.md#get_kyc_document) | **GET** /kyc-documents/{id} | Retrieve a KYC Document
*RebillySdk::KYCDocumentsApi* | [**get_kyc_document_collection**](docs/KYCDocumentsApi.md#get_kyc_document_collection) | **GET** /kyc-documents | Retrieve a list of KYC documents
*RebillySdk::KYCDocumentsApi* | [**get_kyc_request**](docs/KYCDocumentsApi.md#get_kyc_request) | **GET** /kyc-requests/{id} | Retrieve a KYC request
*RebillySdk::KYCDocumentsApi* | [**get_kyc_request_collection**](docs/KYCDocumentsApi.md#get_kyc_request_collection) | **GET** /kyc-requests | Retrieve a list of KYC requests
*RebillySdk::KYCDocumentsApi* | [**patch_kyc_request**](docs/KYCDocumentsApi.md#patch_kyc_request) | **PATCH** /kyc-requests/{id} | Update a KYC request
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document**](docs/KYCDocumentsApi.md#post_kyc_document) | **POST** /kyc-documents | Create a KYC Document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_acceptance**](docs/KYCDocumentsApi.md#post_kyc_document_acceptance) | **POST** /kyc-documents/{id}/acceptance | Accept a KYC document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_matches**](docs/KYCDocumentsApi.md#post_kyc_document_matches) | **POST** /kyc-documents/{id}/matches | Update a KYC document's documentMatches
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_rejection**](docs/KYCDocumentsApi.md#post_kyc_document_rejection) | **POST** /kyc-documents/{id}/rejection | Reject a KYC document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_review**](docs/KYCDocumentsApi.md#post_kyc_document_review) | **POST** /kyc-documents/{id}/review | Review a KYC document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_start_review**](docs/KYCDocumentsApi.md#post_kyc_document_start_review) | **POST** /kyc-documents/{id}/start-review | Start review for a KYC document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_document_stop_review**](docs/KYCDocumentsApi.md#post_kyc_document_stop_review) | **POST** /kyc-documents/{id}/stop-review | Stop review for a KYC document
*RebillySdk::KYCDocumentsApi* | [**post_kyc_request**](docs/KYCDocumentsApi.md#post_kyc_request) | **POST** /kyc-requests | Create a KYC Request
*RebillySdk::KYCDocumentsApi* | [**put_kyc_document**](docs/KYCDocumentsApi.md#put_kyc_document) | **PUT** /kyc-documents/{id} | Create or update a KYC document with predefined ID
*RebillySdk::OrdersApi* | [**delete_subscription**](docs/OrdersApi.md#delete_subscription) | **DELETE** /subscriptions/{id} | Delete a pending order
*RebillySdk::OrdersApi* | [**delete_subscription_cancellation**](docs/OrdersApi.md#delete_subscription_cancellation) | **DELETE** /subscription-cancellations/{id} | Delete a cancellation
*RebillySdk::OrdersApi* | [**get_subscription**](docs/OrdersApi.md#get_subscription) | **GET** /subscriptions/{id} | Retrieve an order
*RebillySdk::OrdersApi* | [**get_subscription_cancellation**](docs/OrdersApi.md#get_subscription_cancellation) | **GET** /subscription-cancellations/{id} | Retrieve an order cancellation
*RebillySdk::OrdersApi* | [**get_subscription_cancellation_collection**](docs/OrdersApi.md#get_subscription_cancellation_collection) | **GET** /subscription-cancellations | Retrieve a list of cancellations
*RebillySdk::OrdersApi* | [**get_subscription_collection**](docs/OrdersApi.md#get_subscription_collection) | **GET** /subscriptions | Retrieve a list of orders
*RebillySdk::OrdersApi* | [**get_subscription_reactivation**](docs/OrdersApi.md#get_subscription_reactivation) | **GET** /subscription-reactivations/{id} | Retrieve an order reactivation
*RebillySdk::OrdersApi* | [**get_subscription_reactivation_collection**](docs/OrdersApi.md#get_subscription_reactivation_collection) | **GET** /subscription-reactivations | Retrieve a list of reactivations
*RebillySdk::OrdersApi* | [**get_subscription_upcoming_invoice_collection**](docs/OrdersApi.md#get_subscription_upcoming_invoice_collection) | **GET** /subscriptions/{id}/upcoming-invoices | Retrieve subscription order's upcoming invoice
*RebillySdk::OrdersApi* | [**post_preview_order**](docs/OrdersApi.md#post_preview_order) | **POST** /previews/orders | Preview an order
*RebillySdk::OrdersApi* | [**post_subscription**](docs/OrdersApi.md#post_subscription) | **POST** /subscriptions | Create an order
*RebillySdk::OrdersApi* | [**post_subscription_cancellation**](docs/OrdersApi.md#post_subscription_cancellation) | **POST** /subscription-cancellations | Cancel an order
*RebillySdk::OrdersApi* | [**post_subscription_interim_invoice**](docs/OrdersApi.md#post_subscription_interim_invoice) | **POST** /subscriptions/{id}/interim-invoice | Issue an interim invoice for a subscription order
*RebillySdk::OrdersApi* | [**post_subscription_items_change**](docs/OrdersApi.md#post_subscription_items_change) | **POST** /subscriptions/{id}/change-items | Change an order's items
*RebillySdk::OrdersApi* | [**post_subscription_reactivation**](docs/OrdersApi.md#post_subscription_reactivation) | **POST** /subscription-reactivations | Reactivate an order
*RebillySdk::OrdersApi* | [**post_subscription_void**](docs/OrdersApi.md#post_subscription_void) | **POST** /subscriptions/{id}/void | Void an order
*RebillySdk::OrdersApi* | [**post_upcoming_invoice_issuance**](docs/OrdersApi.md#post_upcoming_invoice_issuance) | **POST** /subscriptions/{id}/upcoming-invoices/{invoiceId}/issue | Issue an upcoming invoice for early pay
*RebillySdk::OrdersApi* | [**put_subscription**](docs/OrdersApi.md#put_subscription) | **PUT** /subscriptions/{id} | Upsert an order with predefined ID
*RebillySdk::OrdersApi* | [**put_subscription_cancellation**](docs/OrdersApi.md#put_subscription_cancellation) | **PUT** /subscription-cancellations/{id} | Cancel an order
*RebillySdk::OrdersTimelineApi* | [**delete_subscription_timeline**](docs/OrdersTimelineApi.md#delete_subscription_timeline) | **DELETE** /subscriptions/{id}/timeline/{messageId} | Delete an Order Timeline message
*RebillySdk::OrdersTimelineApi* | [**get_subscription_timeline**](docs/OrdersTimelineApi.md#get_subscription_timeline) | **GET** /subscriptions/{id}/timeline/{messageId} | Retrieve an Order Timeline message
*RebillySdk::OrdersTimelineApi* | [**get_subscription_timeline_collection**](docs/OrdersTimelineApi.md#get_subscription_timeline_collection) | **GET** /subscriptions/{id}/timeline | Retrieve a list of order timeline messages
*RebillySdk::OrdersTimelineApi* | [**post_subscription_timeline**](docs/OrdersTimelineApi.md#post_subscription_timeline) | **POST** /subscriptions/{id}/timeline | Create an order Timeline comment
*RebillySdk::PaymentInstrumentsApi* | [**get_payment_instrument**](docs/PaymentInstrumentsApi.md#get_payment_instrument) | **GET** /payment-instruments/{id} | Retrieve a Payment Instrument
*RebillySdk::PaymentInstrumentsApi* | [**get_payment_instrument_collection**](docs/PaymentInstrumentsApi.md#get_payment_instrument_collection) | **GET** /payment-instruments | Retrieve a list of payment instruments
*RebillySdk::PaymentInstrumentsApi* | [**patch_payment_instrument**](docs/PaymentInstrumentsApi.md#patch_payment_instrument) | **PATCH** /payment-instruments/{id} | Update a Payment Instrument's values
*RebillySdk::PaymentInstrumentsApi* | [**post_payment_instrument**](docs/PaymentInstrumentsApi.md#post_payment_instrument) | **POST** /payment-instruments | Create a Payment Instrument
*RebillySdk::PaymentInstrumentsApi* | [**post_payment_instrument_deactivation**](docs/PaymentInstrumentsApi.md#post_payment_instrument_deactivation) | **POST** /payment-instruments/{id}/deactivation | Deactivate a payment instrument
*RebillySdk::PaymentTokensApi* | [**get_token**](docs/PaymentTokensApi.md#get_token) | **GET** /tokens/{token} | Retrieve a token
*RebillySdk::PaymentTokensApi* | [**get_token_collection**](docs/PaymentTokensApi.md#get_token_collection) | **GET** /tokens | Retrieve a list of tokens
*RebillySdk::PaymentTokensApi* | [**post_digital_wallet_validation**](docs/PaymentTokensApi.md#post_digital_wallet_validation) | **POST** /digital-wallets/validation | Validate a digital wallet session
*RebillySdk::PaymentTokensApi* | [**post_token**](docs/PaymentTokensApi.md#post_token) | **POST** /tokens | Create a payment token
*RebillySdk::PlansApi* | [**delete_plan**](docs/PlansApi.md#delete_plan) | **DELETE** /plans/{id} | Delete a Plan
*RebillySdk::PlansApi* | [**get_plan**](docs/PlansApi.md#get_plan) | **GET** /plans/{id} | Retrieve a plan
*RebillySdk::PlansApi* | [**get_plan_collection**](docs/PlansApi.md#get_plan_collection) | **GET** /plans | Retrieve a list of plans
*RebillySdk::PlansApi* | [**post_plan**](docs/PlansApi.md#post_plan) | **POST** /plans | Create a plan
*RebillySdk::PlansApi* | [**put_plan**](docs/PlansApi.md#put_plan) | **PUT** /plans/{id} | Create or update a Plan with predefined ID
*RebillySdk::ProductsApi* | [**delete_product**](docs/ProductsApi.md#delete_product) | **DELETE** /products/{id} | Delete a product
*RebillySdk::ProductsApi* | [**get_product**](docs/ProductsApi.md#get_product) | **GET** /products/{id} | Retrieve a product
*RebillySdk::ProductsApi* | [**get_product_collection**](docs/ProductsApi.md#get_product_collection) | **GET** /products | Retrieve a list of products
*RebillySdk::ProductsApi* | [**post_product**](docs/ProductsApi.md#post_product) | **POST** /products | Create a Product
*RebillySdk::ProductsApi* | [**put_product**](docs/ProductsApi.md#put_product) | **PUT** /products/{id} | Upsert a product with predefined ID
*RebillySdk::SearchApi* | [**get_search**](docs/SearchApi.md#get_search) | **GET** /search | Search merchant data
*RebillySdk::ShippingRatesApi* | [**delete_shipping_rate**](docs/ShippingRatesApi.md#delete_shipping_rate) | **DELETE** /shipping-rates/{id} | Delete a shipping rate
*RebillySdk::ShippingRatesApi* | [**get_shipping_rate**](docs/ShippingRatesApi.md#get_shipping_rate) | **GET** /shipping-rates/{id} | Retrieve a shipping rate
*RebillySdk::ShippingRatesApi* | [**get_shipping_rate_collection**](docs/ShippingRatesApi.md#get_shipping_rate_collection) | **GET** /shipping-rates | Retrieve a list of shipping rates
*RebillySdk::ShippingRatesApi* | [**post_shipping_rate**](docs/ShippingRatesApi.md#post_shipping_rate) | **POST** /shipping-rates | Create a shipping rate
*RebillySdk::ShippingRatesApi* | [**put_shipping_rate**](docs/ShippingRatesApi.md#put_shipping_rate) | **PUT** /shipping-rates/{id} | Create a shipping rate with predefined ID
*RebillySdk::ShippingZonesApi* | [**delete_shipping_zone**](docs/ShippingZonesApi.md#delete_shipping_zone) | **DELETE** /shipping-zones/{id} | Delete a shipping zone
*RebillySdk::ShippingZonesApi* | [**get_shipping_zone**](docs/ShippingZonesApi.md#get_shipping_zone) | **GET** /shipping-zones/{id} | Retrieve a shipping zone
*RebillySdk::ShippingZonesApi* | [**get_shipping_zone_collection**](docs/ShippingZonesApi.md#get_shipping_zone_collection) | **GET** /shipping-zones | Retrieve a list of shipping zones
*RebillySdk::ShippingZonesApi* | [**post_shipping_zone**](docs/ShippingZonesApi.md#post_shipping_zone) | **POST** /shipping-zones | Create a Shipping Zone
*RebillySdk::ShippingZonesApi* | [**put_shipping_zone**](docs/ShippingZonesApi.md#put_shipping_zone) | **PUT** /shipping-zones/{id} | Create a shipping zone with predefined ID
*RebillySdk::TagsApi* | [**delete_tag**](docs/TagsApi.md#delete_tag) | **DELETE** /tags/{tag} | Delete a tag
*RebillySdk::TagsApi* | [**delete_tag_customer**](docs/TagsApi.md#delete_tag_customer) | **DELETE** /tags/{tag}/customers/{customerId} | Untag a customer
*RebillySdk::TagsApi* | [**delete_tag_customer_collection**](docs/TagsApi.md#delete_tag_customer_collection) | **DELETE** /tags/{tag}/customers | Untag a list of customers
*RebillySdk::TagsApi* | [**delete_tag_kyc_document**](docs/TagsApi.md#delete_tag_kyc_document) | **DELETE** /tags/{tag}/kyc-documents/{kycDocumentId} | Untag a kyc document
*RebillySdk::TagsApi* | [**delete_tag_kyc_document_collection**](docs/TagsApi.md#delete_tag_kyc_document_collection) | **DELETE** /tags/{tag}/kyc-documents | Untag a list of kyc documents
*RebillySdk::TagsApi* | [**get_tag**](docs/TagsApi.md#get_tag) | **GET** /tags/{tag} | Retrieve a tag
*RebillySdk::TagsApi* | [**get_tag_collection**](docs/TagsApi.md#get_tag_collection) | **GET** /tags | Retrieve a list of tags
*RebillySdk::TagsApi* | [**patch_tag**](docs/TagsApi.md#patch_tag) | **PATCH** /tags/{tag} | Update a tag
*RebillySdk::TagsApi* | [**post_tag**](docs/TagsApi.md#post_tag) | **POST** /tags | Create a tag
*RebillySdk::TagsApi* | [**post_tag_customer**](docs/TagsApi.md#post_tag_customer) | **POST** /tags/{tag}/customers/{customerId} | Tag a customer
*RebillySdk::TagsApi* | [**post_tag_customer_collection**](docs/TagsApi.md#post_tag_customer_collection) | **POST** /tags/{tag}/customers | Tag a list of customers
*RebillySdk::TagsApi* | [**post_tag_kyc_document**](docs/TagsApi.md#post_tag_kyc_document) | **POST** /tags/{tag}/kyc-documents/{kycDocumentId} | Tag a kyc document
*RebillySdk::TagsApi* | [**post_tag_kyc_document_collection**](docs/TagsApi.md#post_tag_kyc_document_collection) | **POST** /tags/{tag}/kyc-documents | Tag a list of kyc documents
*RebillySdk::TransactionsApi* | [**get_transaction**](docs/TransactionsApi.md#get_transaction) | **GET** /transactions/{id} | Retrieve a Transaction
*RebillySdk::TransactionsApi* | [**get_transaction_collection**](docs/TransactionsApi.md#get_transaction_collection) | **GET** /transactions | Retrieve a list of transactions
*RebillySdk::TransactionsApi* | [**patch_transaction**](docs/TransactionsApi.md#patch_transaction) | **PATCH** /transactions/{id} | Update a transaction
*RebillySdk::TransactionsApi* | [**post_payout**](docs/TransactionsApi.md#post_payout) | **POST** /payouts | Create a credit transaction
*RebillySdk::TransactionsApi* | [**post_ready_to_pay**](docs/TransactionsApi.md#post_ready_to_pay) | **POST** /ready-to-pay | Ready to Pay
*RebillySdk::TransactionsApi* | [**post_transaction**](docs/TransactionsApi.md#post_transaction) | **POST** /transactions | Create a transaction
*RebillySdk::TransactionsApi* | [**post_transaction_query**](docs/TransactionsApi.md#post_transaction_query) | **POST** /transactions/{id}/query | Query a Transaction
*RebillySdk::TransactionsApi* | [**post_transaction_refund**](docs/TransactionsApi.md#post_transaction_refund) | **POST** /transactions/{id}/refund | Refund a Transaction
*RebillySdk::TransactionsApi* | [**post_transaction_update**](docs/TransactionsApi.md#post_transaction_update) | **POST** /transactions/{id}/update | Update a Transaction status
*RebillySdk::TransactionsTimelineApi* | [**delete_transaction_timeline**](docs/TransactionsTimelineApi.md#delete_transaction_timeline) | **DELETE** /transactions/{id}/timeline/{messageId} | Delete a Transaction Timeline message
*RebillySdk::TransactionsTimelineApi* | [**get_transaction_timeline**](docs/TransactionsTimelineApi.md#get_transaction_timeline) | **GET** /transactions/{id}/timeline/{messageId} | Retrieve a transaction Timeline message
*RebillySdk::TransactionsTimelineApi* | [**get_transaction_timeline_collection**](docs/TransactionsTimelineApi.md#get_transaction_timeline_collection) | **GET** /transactions/{id}/timeline | Retrieve a list of transaction timeline messages
*RebillySdk::TransactionsTimelineApi* | [**post_transaction_timeline**](docs/TransactionsTimelineApi.md#post_transaction_timeline) | **POST** /transactions/{id}/timeline | Create a transaction Timeline comment

## Documentation for Models

 - [RebillySdk::A1Gateway](docs/A1Gateway.md)
 - [RebillySdk::A1Gateway3dsServers](docs/A1Gateway3dsServers.md)
 - [RebillySdk::A1GatewayCredentials](docs/A1GatewayCredentials.md)
 - [RebillySdk::AML](docs/AML.md)
 - [RebillySdk::AMLAddress](docs/AMLAddress.md)
 - [RebillySdk::AMLAliases](docs/AMLAliases.md)
 - [RebillySdk::AMLPassport](docs/AMLPassport.md)
 - [RebillySdk::AchPlaidFeature](docs/AchPlaidFeature.md)
 - [RebillySdk::Acl](docs/Acl.md)
 - [RebillySdk::AclInner](docs/AclInner.md)
 - [RebillySdk::AclPermissions](docs/AclPermissions.md)
 - [RebillySdk::AcquirerName](docs/AcquirerName.md)
 - [RebillySdk::AddressMatches](docs/AddressMatches.md)
 - [RebillySdk::Adyen](docs/Adyen.md)
 - [RebillySdk::AdyenCredentials](docs/AdyenCredentials.md)
 - [RebillySdk::AdyenSettings](docs/AdyenSettings.md)
 - [RebillySdk::Airpay](docs/Airpay.md)
 - [RebillySdk::AirpayCredentials](docs/AirpayCredentials.md)
 - [RebillySdk::AllOfA1Gateway3dsServersName](docs/AllOfA1Gateway3dsServersName.md)
 - [RebillySdk::AllOfAclInnerPermissions](docs/AllOfAclInnerPermissions.md)
 - [RebillySdk::AllOfAclInnerScope](docs/AllOfAclInnerScope.md)
 - [RebillySdk::AllOfAlternativePaymentTokenBillingAddress](docs/AllOfAlternativePaymentTokenBillingAddress.md)
 - [RebillySdk::AllOfAlternativePaymentTokenMethod](docs/AllOfAlternativePaymentTokenMethod.md)
 - [RebillySdk::AllOfApiKeyScopeOrganizationIdItems](docs/AllOfApiKeyScopeOrganizationIdItems.md)
 - [RebillySdk::AllOfApiKeyScopePlanIdItems](docs/AllOfApiKeyScopePlanIdItems.md)
 - [RebillySdk::AllOfApiKeyScopeProductIdItems](docs/AllOfApiKeyScopeProductIdItems.md)
 - [RebillySdk::AllOfAttachmentCreatedTime](docs/AllOfAttachmentCreatedTime.md)
 - [RebillySdk::AllOfAttachmentId](docs/AllOfAttachmentId.md)
 - [RebillySdk::AllOfAttachmentUpdatedTime](docs/AllOfAttachmentUpdatedTime.md)
 - [RebillySdk::AllOfAuthenticationTokenCredentialId](docs/AllOfAuthenticationTokenCredentialId.md)
 - [RebillySdk::AllOfBBANTypeBillingAddress](docs/AllOfBBANTypeBillingAddress.md)
 - [RebillySdk::AllOfBBANTypeCustomerId](docs/AllOfBBANTypeCustomerId.md)
 - [RebillySdk::AllOfBankAccountTokenBillingAddress](docs/AllOfBankAccountTokenBillingAddress.md)
 - [RebillySdk::AllOfBankAccountUpdatePlainBillingAddress](docs/AllOfBankAccountUpdatePlainBillingAddress.md)
 - [RebillySdk::AllOfBaseFeeCreatedTime](docs/AllOfBaseFeeCreatedTime.md)
 - [RebillySdk::AllOfBaseFeeFilter](docs/AllOfBaseFeeFilter.md)
 - [RebillySdk::AllOfBaseFeeId](docs/AllOfBaseFeeId.md)
 - [RebillySdk::AllOfBaseFeeUpdatedTime](docs/AllOfBaseFeeUpdatedTime.md)
 - [RebillySdk::AllOfBlocklistCreatedTime](docs/AllOfBlocklistCreatedTime.md)
 - [RebillySdk::AllOfBlocklistId](docs/AllOfBlocklistId.md)
 - [RebillySdk::AllOfBlocklistUpdatedTime](docs/AllOfBlocklistUpdatedTime.md)
 - [RebillySdk::AllOfCheckoutCom3dsServersName](docs/AllOfCheckoutCom3dsServersName.md)
 - [RebillySdk::AllOfClearhaus3dsServersName](docs/AllOfClearhaus3dsServersName.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentBillingAddress](docs/AllOfCommonAlternativeInstrumentBillingAddress.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentCreatedTime](docs/AllOfCommonAlternativeInstrumentCreatedTime.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentCustomerId](docs/AllOfCommonAlternativeInstrumentCustomerId.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentId](docs/AllOfCommonAlternativeInstrumentId.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentMethod](docs/AllOfCommonAlternativeInstrumentMethod.md)
 - [RebillySdk::AllOfCommonAlternativeInstrumentUpdatedTime](docs/AllOfCommonAlternativeInstrumentUpdatedTime.md)
 - [RebillySdk::AllOfCommonBankAccountBillingAddress](docs/AllOfCommonBankAccountBillingAddress.md)
 - [RebillySdk::AllOfCommonBankAccountCreatedTime](docs/AllOfCommonBankAccountCreatedTime.md)
 - [RebillySdk::AllOfCommonBankAccountCustomerId](docs/AllOfCommonBankAccountCustomerId.md)
 - [RebillySdk::AllOfCommonBankAccountId](docs/AllOfCommonBankAccountId.md)
 - [RebillySdk::AllOfCommonBankAccountUpdatedTime](docs/AllOfCommonBankAccountUpdatedTime.md)
 - [RebillySdk::AllOfCommonInvoiceAbandonedTime](docs/AllOfCommonInvoiceAbandonedTime.md)
 - [RebillySdk::AllOfCommonInvoiceBillingAddress](docs/AllOfCommonInvoiceBillingAddress.md)
 - [RebillySdk::AllOfCommonInvoiceCreatedTime](docs/AllOfCommonInvoiceCreatedTime.md)
 - [RebillySdk::AllOfCommonInvoiceCurrency](docs/AllOfCommonInvoiceCurrency.md)
 - [RebillySdk::AllOfCommonInvoiceDeliveryAddress](docs/AllOfCommonInvoiceDeliveryAddress.md)
 - [RebillySdk::AllOfCommonInvoiceDiscountsItems](docs/AllOfCommonInvoiceDiscountsItems.md)
 - [RebillySdk::AllOfCommonInvoiceId](docs/AllOfCommonInvoiceId.md)
 - [RebillySdk::AllOfCommonInvoiceIssuedTime](docs/AllOfCommonInvoiceIssuedTime.md)
 - [RebillySdk::AllOfCommonInvoicePaidTime](docs/AllOfCommonInvoicePaidTime.md)
 - [RebillySdk::AllOfCommonInvoiceSubscriptionId](docs/AllOfCommonInvoiceSubscriptionId.md)
 - [RebillySdk::AllOfCommonInvoiceUpdatedTime](docs/AllOfCommonInvoiceUpdatedTime.md)
 - [RebillySdk::AllOfCommonInvoiceVoidedTime](docs/AllOfCommonInvoiceVoidedTime.md)
 - [RebillySdk::AllOfCommonInvoiceWebsiteId](docs/AllOfCommonInvoiceWebsiteId.md)
 - [RebillySdk::AllOfCommonKycDocumentCreatedTime](docs/AllOfCommonKycDocumentCreatedTime.md)
 - [RebillySdk::AllOfCommonKycDocumentDocumentSubtype](docs/AllOfCommonKycDocumentDocumentSubtype.md)
 - [RebillySdk::AllOfCommonKycDocumentDocumentType](docs/AllOfCommonKycDocumentDocumentType.md)
 - [RebillySdk::AllOfCommonKycDocumentFileId](docs/AllOfCommonKycDocumentFileId.md)
 - [RebillySdk::AllOfCommonKycDocumentFileIdsItems](docs/AllOfCommonKycDocumentFileIdsItems.md)
 - [RebillySdk::AllOfCommonKycDocumentId](docs/AllOfCommonKycDocumentId.md)
 - [RebillySdk::AllOfCommonKycDocumentProcessedTime](docs/AllOfCommonKycDocumentProcessedTime.md)
 - [RebillySdk::AllOfCommonKycDocumentRequestId](docs/AllOfCommonKycDocumentRequestId.md)
 - [RebillySdk::AllOfCommonKycDocumentUpdatedTime](docs/AllOfCommonKycDocumentUpdatedTime.md)
 - [RebillySdk::AllOfCommonKycRequestCreatedTime](docs/AllOfCommonKycRequestCreatedTime.md)
 - [RebillySdk::AllOfCommonKycRequestDocumentsType](docs/AllOfCommonKycRequestDocumentsType.md)
 - [RebillySdk::AllOfCommonKycRequestId](docs/AllOfCommonKycRequestId.md)
 - [RebillySdk::AllOfCommonKycRequestUpdatedTime](docs/AllOfCommonKycRequestUpdatedTime.md)
 - [RebillySdk::AllOfCommonOrderActivationTime](docs/AllOfCommonOrderActivationTime.md)
 - [RebillySdk::AllOfCommonOrderBillingAddress](docs/AllOfCommonOrderBillingAddress.md)
 - [RebillySdk::AllOfCommonOrderCurrency](docs/AllOfCommonOrderCurrency.md)
 - [RebillySdk::AllOfCommonOrderDeliveryAddress](docs/AllOfCommonOrderDeliveryAddress.md)
 - [RebillySdk::AllOfCommonOrderId](docs/AllOfCommonOrderId.md)
 - [RebillySdk::AllOfCommonOrderInitialInvoiceId](docs/AllOfCommonOrderInitialInvoiceId.md)
 - [RebillySdk::AllOfCommonOrderItemsPlanId](docs/AllOfCommonOrderItemsPlanId.md)
 - [RebillySdk::AllOfCommonOrderPreviewBillingAddress](docs/AllOfCommonOrderPreviewBillingAddress.md)
 - [RebillySdk::AllOfCommonOrderPreviewCurrency](docs/AllOfCommonOrderPreviewCurrency.md)
 - [RebillySdk::AllOfCommonOrderPreviewDeliveryAddress](docs/AllOfCommonOrderPreviewDeliveryAddress.md)
 - [RebillySdk::AllOfCommonOrderPreviewDiscountsCouponId](docs/AllOfCommonOrderPreviewDiscountsCouponId.md)
 - [RebillySdk::AllOfCommonOrderPreviewItemsPlanId](docs/AllOfCommonOrderPreviewItemsPlanId.md)
 - [RebillySdk::AllOfCommonOrderPreviewLineItemsPlanId](docs/AllOfCommonOrderPreviewLineItemsPlanId.md)
 - [RebillySdk::AllOfCommonOrderPreviewLineItemsProductId](docs/AllOfCommonOrderPreviewLineItemsProductId.md)
 - [RebillySdk::AllOfCommonOrderPreviewWebsiteId](docs/AllOfCommonOrderPreviewWebsiteId.md)
 - [RebillySdk::AllOfCommonOrderRecentInvoiceId](docs/AllOfCommonOrderRecentInvoiceId.md)
 - [RebillySdk::AllOfCommonOrderVoidTime](docs/AllOfCommonOrderVoidTime.md)
 - [RebillySdk::AllOfCommonOrderWebsiteId](docs/AllOfCommonOrderWebsiteId.md)
 - [RebillySdk::AllOfCommonPayPalAccountBillingAddress](docs/AllOfCommonPayPalAccountBillingAddress.md)
 - [RebillySdk::AllOfCommonPayPalAccountCreatedTime](docs/AllOfCommonPayPalAccountCreatedTime.md)
 - [RebillySdk::AllOfCommonPayPalAccountCustomerId](docs/AllOfCommonPayPalAccountCustomerId.md)
 - [RebillySdk::AllOfCommonPayPalAccountId](docs/AllOfCommonPayPalAccountId.md)
 - [RebillySdk::AllOfCommonPayPalAccountUpdatedTime](docs/AllOfCommonPayPalAccountUpdatedTime.md)
 - [RebillySdk::AllOfCommonPaymentCardBillingAddress](docs/AllOfCommonPaymentCardBillingAddress.md)
 - [RebillySdk::AllOfCommonPaymentCardBrand](docs/AllOfCommonPaymentCardBrand.md)
 - [RebillySdk::AllOfCommonPaymentCardCreatedTime](docs/AllOfCommonPaymentCardCreatedTime.md)
 - [RebillySdk::AllOfCommonPaymentCardCustomerId](docs/AllOfCommonPaymentCardCustomerId.md)
 - [RebillySdk::AllOfCommonPaymentCardId](docs/AllOfCommonPaymentCardId.md)
 - [RebillySdk::AllOfCommonPaymentCardUpdatedTime](docs/AllOfCommonPaymentCardUpdatedTime.md)
 - [RebillySdk::AllOfCommonPaymentTokenCreatedTime](docs/AllOfCommonPaymentTokenCreatedTime.md)
 - [RebillySdk::AllOfCommonPaymentTokenExpirationTime](docs/AllOfCommonPaymentTokenExpirationTime.md)
 - [RebillySdk::AllOfCommonPaymentTokenId](docs/AllOfCommonPaymentTokenId.md)
 - [RebillySdk::AllOfCommonPaymentTokenLeadSource](docs/AllOfCommonPaymentTokenLeadSource.md)
 - [RebillySdk::AllOfCommonPaymentTokenRiskMetadata](docs/AllOfCommonPaymentTokenRiskMetadata.md)
 - [RebillySdk::AllOfCommonPaymentTokenUpdatedTime](docs/AllOfCommonPaymentTokenUpdatedTime.md)
 - [RebillySdk::AllOfCommonPaymentTokenUsageTime](docs/AllOfCommonPaymentTokenUsageTime.md)
 - [RebillySdk::AllOfCommonPlanCreatedTime](docs/AllOfCommonPlanCreatedTime.md)
 - [RebillySdk::AllOfCommonPlanCurrency](docs/AllOfCommonPlanCurrency.md)
 - [RebillySdk::AllOfCommonPlanId](docs/AllOfCommonPlanId.md)
 - [RebillySdk::AllOfCommonPlanProductId](docs/AllOfCommonPlanProductId.md)
 - [RebillySdk::AllOfCommonPlanRecurringInterval](docs/AllOfCommonPlanRecurringInterval.md)
 - [RebillySdk::AllOfCommonPlanUpdatedTime](docs/AllOfCommonPlanUpdatedTime.md)
 - [RebillySdk::AllOfCommonProductCreatedTime](docs/AllOfCommonProductCreatedTime.md)
 - [RebillySdk::AllOfCommonProductId](docs/AllOfCommonProductId.md)
 - [RebillySdk::AllOfCommonProductUpdatedTime](docs/AllOfCommonProductUpdatedTime.md)
 - [RebillySdk::AllOfCommonTransaction3ds](docs/AllOfCommonTransaction3ds.md)
 - [RebillySdk::AllOfCommonTransactionBillingAddress](docs/AllOfCommonTransactionBillingAddress.md)
 - [RebillySdk::AllOfCommonTransactionCreatedTime](docs/AllOfCommonTransactionCreatedTime.md)
 - [RebillySdk::AllOfCommonTransactionCurrency](docs/AllOfCommonTransactionCurrency.md)
 - [RebillySdk::AllOfCommonTransactionCustomerId](docs/AllOfCommonTransactionCustomerId.md)
 - [RebillySdk::AllOfCommonTransactionGatewayName](docs/AllOfCommonTransactionGatewayName.md)
 - [RebillySdk::AllOfCommonTransactionId](docs/AllOfCommonTransactionId.md)
 - [RebillySdk::AllOfCommonTransactionParentTransactionId](docs/AllOfCommonTransactionParentTransactionId.md)
 - [RebillySdk::AllOfCommonTransactionProcessedTime](docs/AllOfCommonTransactionProcessedTime.md)
 - [RebillySdk::AllOfCommonTransactionPurchaseCurrency](docs/AllOfCommonTransactionPurchaseCurrency.md)
 - [RebillySdk::AllOfCommonTransactionRequestBillingAddress](docs/AllOfCommonTransactionRequestBillingAddress.md)
 - [RebillySdk::AllOfCommonTransactionRequestCurrency](docs/AllOfCommonTransactionRequestCurrency.md)
 - [RebillySdk::AllOfCommonTransactionRequestCustomerId](docs/AllOfCommonTransactionRequestCustomerId.md)
 - [RebillySdk::AllOfCommonTransactionRequestGatewayAccountId](docs/AllOfCommonTransactionRequestGatewayAccountId.md)
 - [RebillySdk::AllOfCommonTransactionRequestPaymentInstruction](docs/AllOfCommonTransactionRequestPaymentInstruction.md)
 - [RebillySdk::AllOfCommonTransactionRequestWebsiteId](docs/AllOfCommonTransactionRequestWebsiteId.md)
 - [RebillySdk::AllOfCommonTransactionUpdatedTime](docs/AllOfCommonTransactionUpdatedTime.md)
 - [RebillySdk::AllOfCommonTransactionWebsiteId](docs/AllOfCommonTransactionWebsiteId.md)
 - [RebillySdk::AllOfCouponCreatedTime](docs/AllOfCouponCreatedTime.md)
 - [RebillySdk::AllOfCouponId](docs/AllOfCouponId.md)
 - [RebillySdk::AllOfCouponRedemptionCanceledTime](docs/AllOfCouponRedemptionCanceledTime.md)
 - [RebillySdk::AllOfCouponRedemptionCouponId](docs/AllOfCouponRedemptionCouponId.md)
 - [RebillySdk::AllOfCouponRedemptionCreatedTime](docs/AllOfCouponRedemptionCreatedTime.md)
 - [RebillySdk::AllOfCouponRedemptionCustomerId](docs/AllOfCouponRedemptionCustomerId.md)
 - [RebillySdk::AllOfCouponRedemptionId](docs/AllOfCouponRedemptionId.md)
 - [RebillySdk::AllOfCouponUpdatedTime](docs/AllOfCouponUpdatedTime.md)
 - [RebillySdk::AllOfCredentialId](docs/AllOfCredentialId.md)
 - [RebillySdk::AllOfCustomerAverageValueCurrency](docs/AllOfCustomerAverageValueCurrency.md)
 - [RebillySdk::AllOfCustomerCreatedTime](docs/AllOfCustomerCreatedTime.md)
 - [RebillySdk::AllOfCustomerId](docs/AllOfCustomerId.md)
 - [RebillySdk::AllOfCustomerJWTCustomerId](docs/AllOfCustomerJWTCustomerId.md)
 - [RebillySdk::AllOfCustomerJWTId](docs/AllOfCustomerJWTId.md)
 - [RebillySdk::AllOfCustomerJWTUpdatedTime](docs/AllOfCustomerJWTUpdatedTime.md)
 - [RebillySdk::AllOfCustomerLastPaymentTime](docs/AllOfCustomerLastPaymentTime.md)
 - [RebillySdk::AllOfCustomerLifetimeRevenueCurrency](docs/AllOfCustomerLifetimeRevenueCurrency.md)
 - [RebillySdk::AllOfCustomerTimelineCustomEventCreatedTime](docs/AllOfCustomerTimelineCustomEventCreatedTime.md)
 - [RebillySdk::AllOfCustomerTimelineCustomEventId](docs/AllOfCustomerTimelineCustomEventId.md)
 - [RebillySdk::AllOfCustomerTimelineCustomEventUpdatedTime](docs/AllOfCustomerTimelineCustomEventUpdatedTime.md)
 - [RebillySdk::AllOfCustomerTimelineId](docs/AllOfCustomerTimelineId.md)
 - [RebillySdk::AllOfCustomerTimelineOccurredTime](docs/AllOfCustomerTimelineOccurredTime.md)
 - [RebillySdk::AllOfCustomerUpdatedTime](docs/AllOfCustomerUpdatedTime.md)
 - [RebillySdk::AllOfCustomerWebsiteId](docs/AllOfCustomerWebsiteId.md)
 - [RebillySdk::AllOfDataCash3dsServersName](docs/AllOfDataCash3dsServersName.md)
 - [RebillySdk::AllOfDigitalWalletTokenBillingAddress](docs/AllOfDigitalWalletTokenBillingAddress.md)
 - [RebillySdk::AllOfDigitalWalletTokenPaymentInstrumentBrand](docs/AllOfDigitalWalletTokenPaymentInstrumentBrand.md)
 - [RebillySdk::AllOfDigitalWalletTokenPaymentInstrumentCurrency](docs/AllOfDigitalWalletTokenPaymentInstrumentCurrency.md)
 - [RebillySdk::AllOfDisputeCreatedTime](docs/AllOfDisputeCreatedTime.md)
 - [RebillySdk::AllOfDisputeCurrency](docs/AllOfDisputeCurrency.md)
 - [RebillySdk::AllOfDisputeId](docs/AllOfDisputeId.md)
 - [RebillySdk::AllOfDisputeResolvedTime](docs/AllOfDisputeResolvedTime.md)
 - [RebillySdk::AllOfDisputeUpdatedTime](docs/AllOfDisputeUpdatedTime.md)
 - [RebillySdk::AllOfEMS3dsServersName](docs/AllOfEMS3dsServersName.md)
 - [RebillySdk::AllOfFileCreatedTime](docs/AllOfFileCreatedTime.md)
 - [RebillySdk::AllOfFileId](docs/AllOfFileId.md)
 - [RebillySdk::AllOfFileUpdatedTime](docs/AllOfFileUpdatedTime.md)
 - [RebillySdk::AllOfFlexiblePlanId](docs/AllOfFlexiblePlanId.md)
 - [RebillySdk::AllOfFullPaymentCardTokenBillingAddress](docs/AllOfFullPaymentCardTokenBillingAddress.md)
 - [RebillySdk::AllOfFullPaymentCardTokenPaymentInstrumentBrand](docs/AllOfFullPaymentCardTokenPaymentInstrumentBrand.md)
 - [RebillySdk::AllOfGET3dsServersName](docs/AllOfGET3dsServersName.md)
 - [RebillySdk::AllOfGatewayAccountAcquirerName](docs/AllOfGatewayAccountAcquirerName.md)
 - [RebillySdk::AllOfGatewayAccountCreatedTime](docs/AllOfGatewayAccountCreatedTime.md)
 - [RebillySdk::AllOfGatewayAccountId](docs/AllOfGatewayAccountId.md)
 - [RebillySdk::AllOfGatewayAccountLimitCreatedTime](docs/AllOfGatewayAccountLimitCreatedTime.md)
 - [RebillySdk::AllOfGatewayAccountLimitId](docs/AllOfGatewayAccountLimitId.md)
 - [RebillySdk::AllOfGatewayAccountLimitUpdatedTime](docs/AllOfGatewayAccountLimitUpdatedTime.md)
 - [RebillySdk::AllOfGatewayAccountOrganizationId](docs/AllOfGatewayAccountOrganizationId.md)
 - [RebillySdk::AllOfGatewayAccountUpdatedTime](docs/AllOfGatewayAccountUpdatedTime.md)
 - [RebillySdk::AllOfIBANTypeBillingAddress](docs/AllOfIBANTypeBillingAddress.md)
 - [RebillySdk::AllOfIBANTypeCustomerId](docs/AllOfIBANTypeCustomerId.md)
 - [RebillySdk::AllOfIlixium3dsServersName](docs/AllOfIlixium3dsServersName.md)
 - [RebillySdk::AllOfIngenico3dsServersName](docs/AllOfIngenico3dsServersName.md)
 - [RebillySdk::AllOfInovio3dsServersName](docs/AllOfInovio3dsServersName.md)
 - [RebillySdk::AllOfInstrumentReferencePaymentInstrumentId](docs/AllOfInstrumentReferencePaymentInstrumentId.md)
 - [RebillySdk::AllOfInvoiceDiscountCouponId](docs/AllOfInvoiceDiscountCouponId.md)
 - [RebillySdk::AllOfInvoiceDiscountRedemptionId](docs/AllOfInvoiceDiscountRedemptionId.md)
 - [RebillySdk::AllOfInvoiceItemCreatedTime](docs/AllOfInvoiceItemCreatedTime.md)
 - [RebillySdk::AllOfInvoiceItemId](docs/AllOfInvoiceItemId.md)
 - [RebillySdk::AllOfInvoiceItemProductId](docs/AllOfInvoiceItemProductId.md)
 - [RebillySdk::AllOfInvoiceItemTax](docs/AllOfInvoiceItemTax.md)
 - [RebillySdk::AllOfInvoiceItemUpdatedTime](docs/AllOfInvoiceItemUpdatedTime.md)
 - [RebillySdk::AllOfInvoiceTimelineId](docs/AllOfInvoiceTimelineId.md)
 - [RebillySdk::AllOfInvoiceTimelineOccurredTime](docs/AllOfInvoiceTimelineOccurredTime.md)
 - [RebillySdk::AllOfInvoiceTransactionAllocationCurrency](docs/AllOfInvoiceTransactionAllocationCurrency.md)
 - [RebillySdk::AllOfKhelocardCardBillingAddress](docs/AllOfKhelocardCardBillingAddress.md)
 - [RebillySdk::AllOfKhelocardCardCreatedTime](docs/AllOfKhelocardCardCreatedTime.md)
 - [RebillySdk::AllOfKhelocardCardCustomerId](docs/AllOfKhelocardCardCustomerId.md)
 - [RebillySdk::AllOfKhelocardCardId](docs/AllOfKhelocardCardId.md)
 - [RebillySdk::AllOfKhelocardCardTokenBillingAddress](docs/AllOfKhelocardCardTokenBillingAddress.md)
 - [RebillySdk::AllOfKhelocardCardUpdatedTime](docs/AllOfKhelocardCardUpdatedTime.md)
 - [RebillySdk::AllOfLeadSourceDataCreatedTime](docs/AllOfLeadSourceDataCreatedTime.md)
 - [RebillySdk::AllOfNGenius3dsServersName](docs/AllOfNGenius3dsServersName.md)
 - [RebillySdk::AllOfNMI3dsServersName](docs/AllOfNMI3dsServersName.md)
 - [RebillySdk::AllOfOrderTimelineId](docs/AllOfOrderTimelineId.md)
 - [RebillySdk::AllOfOrderTimelineOccurredTime](docs/AllOfOrderTimelineOccurredTime.md)
 - [RebillySdk::AllOfOrganizationCreatedTime](docs/AllOfOrganizationCreatedTime.md)
 - [RebillySdk::AllOfOrganizationId](docs/AllOfOrganizationId.md)
 - [RebillySdk::AllOfOrganizationUpdatedTime](docs/AllOfOrganizationUpdatedTime.md)
 - [RebillySdk::AllOfOriginalPlanId](docs/AllOfOriginalPlanId.md)
 - [RebillySdk::AllOfPanamerican3dsServersName](docs/AllOfPanamerican3dsServersName.md)
 - [RebillySdk::AllOfPartialPaymentCardTokenBillingAddress](docs/AllOfPartialPaymentCardTokenBillingAddress.md)
 - [RebillySdk::AllOfPartialPaymentCardTokenPaymentInstrumentBrand](docs/AllOfPartialPaymentCardTokenPaymentInstrumentBrand.md)
 - [RebillySdk::AllOfPayPalTokenBillingAddress](docs/AllOfPayPalTokenBillingAddress.md)
 - [RebillySdk::AllOfPaymentCardCreatePlainBillingAddress](docs/AllOfPaymentCardCreatePlainBillingAddress.md)
 - [RebillySdk::AllOfPaymentCardCreatePlainCustomerId](docs/AllOfPaymentCardCreatePlainCustomerId.md)
 - [RebillySdk::AllOfPaymentCardUpdatePlainBillingAddress](docs/AllOfPaymentCardUpdatePlainBillingAddress.md)
 - [RebillySdk::AllOfPaymentCardUpdatePlainStickyGatewayAccountId](docs/AllOfPaymentCardUpdatePlainStickyGatewayAccountId.md)
 - [RebillySdk::AllOfPaymentInstrument3PaymentInstrumentId](docs/AllOfPaymentInstrument3PaymentInstrumentId.md)
 - [RebillySdk::AllOfPaymentInstrumentCreateTokenCustomerId](docs/AllOfPaymentInstrumentCreateTokenCustomerId.md)
 - [RebillySdk::AllOfPaymentInstrumentUpdateTokenBillingAddress](docs/AllOfPaymentInstrumentUpdateTokenBillingAddress.md)
 - [RebillySdk::AllOfPaysafe3dsServersName](docs/AllOfPaysafe3dsServersName.md)
 - [RebillySdk::AllOfPayvision3dsServersName](docs/AllOfPayvision3dsServersName.md)
 - [RebillySdk::AllOfPiastrix3dsServersName](docs/AllOfPiastrix3dsServersName.md)
 - [RebillySdk::AllOfPlaidAccountTokenBillingAddress](docs/AllOfPlaidAccountTokenBillingAddress.md)
 - [RebillySdk::AllOfPriceBasedShippingRateCurrency](docs/AllOfPriceBasedShippingRateCurrency.md)
 - [RebillySdk::AllOfProsa3dsServersName](docs/AllOfProsa3dsServersName.md)
 - [RebillySdk::AllOfPurchaseBumpOfferBumpAmount](docs/AllOfPurchaseBumpOfferBumpAmount.md)
 - [RebillySdk::AllOfPurchaseBumpOfferBumpAmountInUsd](docs/AllOfPurchaseBumpOfferBumpAmountInUsd.md)
 - [RebillySdk::AllOfReadyToPayBillingAddress](docs/AllOfReadyToPayBillingAddress.md)
 - [RebillySdk::AllOfReadyToPayGenericMethodMethod](docs/AllOfReadyToPayGenericMethodMethod.md)
 - [RebillySdk::AllOfReadyToPayItemsItemsPlanId](docs/AllOfReadyToPayItemsItemsPlanId.md)
 - [RebillySdk::AllOfReadyToPayWebsiteId](docs/AllOfReadyToPayWebsiteId.md)
 - [RebillySdk::AllOfSafecharge3dsServersName](docs/AllOfSafecharge3dsServersName.md)
 - [RebillySdk::AllOfSearchCustomersItems](docs/AllOfSearchCustomersItems.md)
 - [RebillySdk::AllOfSearchInvoicesItems](docs/AllOfSearchInvoicesItems.md)
 - [RebillySdk::AllOfSearchOrdersItems](docs/AllOfSearchOrdersItems.md)
 - [RebillySdk::AllOfSearchTransactionsItems](docs/AllOfSearchTransactionsItems.md)
 - [RebillySdk::AllOfSecureTrading3dsServersName](docs/AllOfSecureTrading3dsServersName.md)
 - [RebillySdk::AllOfSecurionPay3dsServersName](docs/AllOfSecurionPay3dsServersName.md)
 - [RebillySdk::AllOfShippingOptionCurrency](docs/AllOfShippingOptionCurrency.md)
 - [RebillySdk::AllOfShippingOptionId](docs/AllOfShippingOptionId.md)
 - [RebillySdk::AllOfShippingZoneCreatedTime](docs/AllOfShippingZoneCreatedTime.md)
 - [RebillySdk::AllOfShippingZoneId](docs/AllOfShippingZoneId.md)
 - [RebillySdk::AllOfShippingZoneRatesItems](docs/AllOfShippingZoneRatesItems.md)
 - [RebillySdk::AllOfShippingZoneUpdatedTime](docs/AllOfShippingZoneUpdatedTime.md)
 - [RebillySdk::AllOfSmartInvoice3dsServersName](docs/AllOfSmartInvoice3dsServersName.md)
 - [RebillySdk::AllOfStripe3dsServersName](docs/AllOfStripe3dsServersName.md)
 - [RebillySdk::AllOfSubscriptionCancellationAppliedInvoiceId](docs/AllOfSubscriptionCancellationAppliedInvoiceId.md)
 - [RebillySdk::AllOfSubscriptionCancellationCreatedTime](docs/AllOfSubscriptionCancellationCreatedTime.md)
 - [RebillySdk::AllOfSubscriptionCancellationId](docs/AllOfSubscriptionCancellationId.md)
 - [RebillySdk::AllOfSubscriptionCancellationLineItems](docs/AllOfSubscriptionCancellationLineItems.md)
 - [RebillySdk::AllOfSubscriptionCancellationProratedInvoiceId](docs/AllOfSubscriptionCancellationProratedInvoiceId.md)
 - [RebillySdk::AllOfSubscriptionCancellationStateCanceledTime](docs/AllOfSubscriptionCancellationStateCanceledTime.md)
 - [RebillySdk::AllOfSubscriptionCancellationSubscriptionId](docs/AllOfSubscriptionCancellationSubscriptionId.md)
 - [RebillySdk::AllOfSubscriptionInvoiceTransactionId](docs/AllOfSubscriptionInvoiceTransactionId.md)
 - [RebillySdk::AllOfSubscriptionMetadataCreatedTime](docs/AllOfSubscriptionMetadataCreatedTime.md)
 - [RebillySdk::AllOfSubscriptionMetadataRiskMetadata](docs/AllOfSubscriptionMetadataRiskMetadata.md)
 - [RebillySdk::AllOfSubscriptionMetadataUpdatedTime](docs/AllOfSubscriptionMetadataUpdatedTime.md)
 - [RebillySdk::AllOfSubscriptionReactivationCancellationId](docs/AllOfSubscriptionReactivationCancellationId.md)
 - [RebillySdk::AllOfSubscriptionReactivationId](docs/AllOfSubscriptionReactivationId.md)
 - [RebillySdk::AllOfSubscriptionReactivationSubscriptionId](docs/AllOfSubscriptionReactivationSubscriptionId.md)
 - [RebillySdk::AllOfTagCreatedTime](docs/AllOfTagCreatedTime.md)
 - [RebillySdk::AllOfTagId](docs/AllOfTagId.md)
 - [RebillySdk::AllOfTagUpdatedTime](docs/AllOfTagUpdatedTime.md)
 - [RebillySdk::AllOfTestProcessor3dsServersName](docs/AllOfTestProcessor3dsServersName.md)
 - [RebillySdk::AllOfTransactionBumpOfferLanguage](docs/AllOfTransactionBumpOfferLanguage.md)
 - [RebillySdk::AllOfTransactionBumpOfferOrder](docs/AllOfTransactionBumpOfferOrder.md)
 - [RebillySdk::AllOfTransactionBumpOfferPresentedOffers](docs/AllOfTransactionBumpOfferPresentedOffers.md)
 - [RebillySdk::AllOfTransactionBumpOfferSelectedOffer](docs/AllOfTransactionBumpOfferSelectedOffer.md)
 - [RebillySdk::AllOfTransactionBumpOfferVersion](docs/AllOfTransactionBumpOfferVersion.md)
 - [RebillySdk::AllOfTransactionDccBase](docs/AllOfTransactionDccBase.md)
 - [RebillySdk::AllOfTransactionDccQuote](docs/AllOfTransactionDccQuote.md)
 - [RebillySdk::AllOfTransactionDccUsdMarkup](docs/AllOfTransactionDccUsdMarkup.md)
 - [RebillySdk::AllOfTransactionQueryCurrency](docs/AllOfTransactionQueryCurrency.md)
 - [RebillySdk::AllOfTransactionTimelineId](docs/AllOfTransactionTimelineId.md)
 - [RebillySdk::AllOfTransactionTimelineOccurredTime](docs/AllOfTransactionTimelineOccurredTime.md)
 - [RebillySdk::AllOfTransactionUpdateCurrency](docs/AllOfTransactionUpdateCurrency.md)
 - [RebillySdk::AllOfTruevo3dsServersName](docs/AllOfTruevo3dsServersName.md)
 - [RebillySdk::AllOfTrustPay3dsServersName](docs/AllOfTrustPay3dsServersName.md)
 - [RebillySdk::AllOfUpcomingInvoiceItemCreatedTime](docs/AllOfUpcomingInvoiceItemCreatedTime.md)
 - [RebillySdk::AllOfUpcomingInvoiceItemUnitPriceCurrency](docs/AllOfUpcomingInvoiceItemUnitPriceCurrency.md)
 - [RebillySdk::AllOfVantivLitle3dsServersName](docs/AllOfVantivLitle3dsServersName.md)
 - [RebillySdk::AllOfVaultedInstrumentMethod](docs/AllOfVaultedInstrumentMethod.md)
 - [RebillySdk::AllOfVaultedInstrumentPaymentInstrumentId](docs/AllOfVaultedInstrumentPaymentInstrumentId.md)
 - [RebillySdk::AllOfWalpay3dsServersName](docs/AllOfWalpay3dsServersName.md)
 - [RebillySdk::AllOfWirecard3dsServersName](docs/AllOfWirecard3dsServersName.md)
 - [RebillySdk::AllOfWorldlineAtosFrankfurt3dsServersName](docs/AllOfWorldlineAtosFrankfurt3dsServersName.md)
 - [RebillySdk::AllOfWorldpay3dsServersName](docs/AllOfWorldpay3dsServersName.md)
 - [RebillySdk::AllOfeMerchantPay3dsServersName](docs/AllOfeMerchantPay3dsServersName.md)
 - [RebillySdk::AlternativeInstrument](docs/AlternativeInstrument.md)
 - [RebillySdk::AlternativePaymentInstrument](docs/AlternativePaymentInstrument.md)
 - [RebillySdk::AlternativePaymentMethods](docs/AlternativePaymentMethods.md)
 - [RebillySdk::AlternativePaymentToken](docs/AlternativePaymentToken.md)
 - [RebillySdk::AmazonPay](docs/AmazonPay.md)
 - [RebillySdk::AmazonPayCredentials](docs/AmazonPayCredentials.md)
 - [RebillySdk::AmexVPC](docs/AmexVPC.md)
 - [RebillySdk::AmexVPCCredentials](docs/AmexVPCCredentials.md)
 - [RebillySdk::AmexVPCSettings](docs/AmexVPCSettings.md)
 - [RebillySdk::AmountAdjustment](docs/AmountAdjustment.md)
 - [RebillySdk::AmountAdjustmentTolerance](docs/AmountAdjustmentTolerance.md)
 - [RebillySdk::AnyOfAttachmentEmbeddedItems](docs/AnyOfAttachmentEmbeddedItems.md)
 - [RebillySdk::AnyOfAttachmentLinksItems](docs/AnyOfAttachmentLinksItems.md)
 - [RebillySdk::AnyOfBankAccountCreatePlain](docs/AnyOfBankAccountCreatePlain.md)
 - [RebillySdk::AnyOfBaseFeeLinksItems](docs/AnyOfBaseFeeLinksItems.md)
 - [RebillySdk::AnyOfCommonAlternativeInstrumentEmbeddedItems](docs/AnyOfCommonAlternativeInstrumentEmbeddedItems.md)
 - [RebillySdk::AnyOfCommonAlternativeInstrumentLinksItems](docs/AnyOfCommonAlternativeInstrumentLinksItems.md)
 - [RebillySdk::AnyOfCommonKycDocumentLinksItems](docs/AnyOfCommonKycDocumentLinksItems.md)
 - [RebillySdk::AnyOfCompositeToken](docs/AnyOfCompositeToken.md)
 - [RebillySdk::AnyOfCredentialLinksItems](docs/AnyOfCredentialLinksItems.md)
 - [RebillySdk::AnyOfCustomerEmbeddedItems](docs/AnyOfCustomerEmbeddedItems.md)
 - [RebillySdk::AnyOfCustomerLinksItems](docs/AnyOfCustomerLinksItems.md)
 - [RebillySdk::AnyOfDisputeEmbeddedItems](docs/AnyOfDisputeEmbeddedItems.md)
 - [RebillySdk::AnyOfDisputeLinksItems](docs/AnyOfDisputeLinksItems.md)
 - [RebillySdk::AnyOfFileLinksItems](docs/AnyOfFileLinksItems.md)
 - [RebillySdk::AnyOfGatewayAccountLinksItems](docs/AnyOfGatewayAccountLinksItems.md)
 - [RebillySdk::AnyOfInvoiceItemEmbeddedItems](docs/AnyOfInvoiceItemEmbeddedItems.md)
 - [RebillySdk::AnyOfInvoiceItemLinksItems](docs/AnyOfInvoiceItemLinksItems.md)
 - [RebillySdk::AnyOfInvoiceTransactionAllocationLinksItems](docs/AnyOfInvoiceTransactionAllocationLinksItems.md)
 - [RebillySdk::AnyOfKhelocardCardEmbeddedItems](docs/AnyOfKhelocardCardEmbeddedItems.md)
 - [RebillySdk::AnyOfKhelocardCardLinksItems](docs/AnyOfKhelocardCardLinksItems.md)
 - [RebillySdk::AnyOfLeadSourceDataLinksItems](docs/AnyOfLeadSourceDataLinksItems.md)
 - [RebillySdk::AnyOfPaymentInstrument](docs/AnyOfPaymentInstrument.md)
 - [RebillySdk::AnyOfReadyToPayMethodsItems](docs/AnyOfReadyToPayMethodsItems.md)
 - [RebillySdk::AnyOfSubscriptionMetadataEmbeddedItems](docs/AnyOfSubscriptionMetadataEmbeddedItems.md)
 - [RebillySdk::AnyOfSubscriptionMetadataLinksItems](docs/AnyOfSubscriptionMetadataLinksItems.md)
 - [RebillySdk::AnyOfTagLinksItems](docs/AnyOfTagLinksItems.md)
 - [RebillySdk::AnyOfidMatchesBody](docs/AnyOfidMatchesBody.md)
 - [RebillySdk::ApcoPay](docs/ApcoPay.md)
 - [RebillySdk::ApcoPayCredentials](docs/ApcoPayCredentials.md)
 - [RebillySdk::ApcoPaySettings](docs/ApcoPaySettings.md)
 - [RebillySdk::ApiKeyScope](docs/ApiKeyScope.md)
 - [RebillySdk::ApplePayFeature](docs/ApplePayFeature.md)
 - [RebillySdk::ApplePayFeatureName](docs/ApplePayFeatureName.md)
 - [RebillySdk::ApplePayValidation](docs/ApplePayValidation.md)
 - [RebillySdk::ApplePayValidationValidationRequest](docs/ApplePayValidationValidationRequest.md)
 - [RebillySdk::ApprovalUrlLink](docs/ApprovalUrlLink.md)
 - [RebillySdk::AsiaPaymentGateway](docs/AsiaPaymentGateway.md)
 - [RebillySdk::AsiaPaymentGatewayCredentials](docs/AsiaPaymentGatewayCredentials.md)
 - [RebillySdk::AsiaPaymentGatewaySettings](docs/AsiaPaymentGatewaySettings.md)
 - [RebillySdk::AstroPayCard](docs/AstroPayCard.md)
 - [RebillySdk::AstroPayCardCredentials](docs/AstroPayCardCredentials.md)
 - [RebillySdk::AstroPayCardSettings](docs/AstroPayCardSettings.md)
 - [RebillySdk::Attachment](docs/Attachment.md)
 - [RebillySdk::AttachmentResourceLink](docs/AttachmentResourceLink.md)
 - [RebillySdk::AuthTransactionEmbed](docs/AuthTransactionEmbed.md)
 - [RebillySdk::AuthTransactionLink](docs/AuthTransactionLink.md)
 - [RebillySdk::AuthenticationOptions](docs/AuthenticationOptions.md)
 - [RebillySdk::AuthenticationToken](docs/AuthenticationToken.md)
 - [RebillySdk::AuthenticationTokenMetadata](docs/AuthenticationTokenMetadata.md)
 - [RebillySdk::AuthorizeNet](docs/AuthorizeNet.md)
 - [RebillySdk::AuthorizeNetCredentials](docs/AuthorizeNetCredentials.md)
 - [RebillySdk::Auto](docs/Auto.md)
 - [RebillySdk::Awepay](docs/Awepay.md)
 - [RebillySdk::AwepayCredentials](docs/AwepayCredentials.md)
 - [RebillySdk::BBANInstrument](docs/BBANInstrument.md)
 - [RebillySdk::BBANType](docs/BBANType.md)
 - [RebillySdk::Bambora](docs/Bambora.md)
 - [RebillySdk::BamboraCredentials](docs/BamboraCredentials.md)
 - [RebillySdk::BankAccount](docs/BankAccount.md)
 - [RebillySdk::BankAccountCreatePlain](docs/BankAccountCreatePlain.md)
 - [RebillySdk::BankAccountEmbed](docs/BankAccountEmbed.md)
 - [RebillySdk::BankAccountInstrument](docs/BankAccountInstrument.md)
 - [RebillySdk::BankAccountToken](docs/BankAccountToken.md)
 - [RebillySdk::BankAccountUpdatePlain](docs/BankAccountUpdatePlain.md)
 - [RebillySdk::BaseFee](docs/BaseFee.md)
 - [RebillySdk::Bips](docs/Bips.md)
 - [RebillySdk::BitPay](docs/BitPay.md)
 - [RebillySdk::BitPayCredentials](docs/BitPayCredentials.md)
 - [RebillySdk::BlankProblem](docs/BlankProblem.md)
 - [RebillySdk::Blocklist](docs/Blocklist.md)
 - [RebillySdk::BlueSnap](docs/BlueSnap.md)
 - [RebillySdk::BlueSnapCredentials](docs/BlueSnapCredentials.md)
 - [RebillySdk::BlueSnapSettings](docs/BlueSnapSettings.md)
 - [RebillySdk::BraintreePayments](docs/BraintreePayments.md)
 - [RebillySdk::BraintreePaymentsCredentials](docs/BraintreePaymentsCredentials.md)
 - [RebillySdk::BrowserData](docs/BrowserData.md)
 - [RebillySdk::CASHlib](docs/CASHlib.md)
 - [RebillySdk::CASHlibCredentials](docs/CASHlibCredentials.md)
 - [RebillySdk::CCAvenue](docs/CCAvenue.md)
 - [RebillySdk::CCAvenueCredentials](docs/CCAvenueCredentials.md)
 - [RebillySdk::CCAvenueSettings](docs/CCAvenueSettings.md)
 - [RebillySdk::CODVoucher](docs/CODVoucher.md)
 - [RebillySdk::CODVoucherCredentials](docs/CODVoucherCredentials.md)
 - [RebillySdk::Cardknox](docs/Cardknox.md)
 - [RebillySdk::CardknoxCredentials](docs/CardknoxCredentials.md)
 - [RebillySdk::CashInstrument](docs/CashInstrument.md)
 - [RebillySdk::CashToCode](docs/CashToCode.md)
 - [RebillySdk::CashToCodeCredentials](docs/CashToCodeCredentials.md)
 - [RebillySdk::CashToCodeSettings](docs/CashToCodeSettings.md)
 - [RebillySdk::Cashflows](docs/Cashflows.md)
 - [RebillySdk::CashflowsCredentials](docs/CashflowsCredentials.md)
 - [RebillySdk::CauriPayment](docs/CauriPayment.md)
 - [RebillySdk::CauriPaymentCredentials](docs/CauriPaymentCredentials.md)
 - [RebillySdk::Cayan](docs/Cayan.md)
 - [RebillySdk::CayanCredentials](docs/CayanCredentials.md)
 - [RebillySdk::Chase](docs/Chase.md)
 - [RebillySdk::ChaseCredentials](docs/ChaseCredentials.md)
 - [RebillySdk::CheckInstrument](docs/CheckInstrument.md)
 - [RebillySdk::CheckoutCom](docs/CheckoutCom.md)
 - [RebillySdk::CheckoutCom3dsServers](docs/CheckoutCom3dsServers.md)
 - [RebillySdk::CheckoutComCredentials](docs/CheckoutComCredentials.md)
 - [RebillySdk::ChildTransactionsEmbed](docs/ChildTransactionsEmbed.md)
 - [RebillySdk::Circle](docs/Circle.md)
 - [RebillySdk::CircleCredentials](docs/CircleCredentials.md)
 - [RebillySdk::Citadel](docs/Citadel.md)
 - [RebillySdk::CitadelCredentials](docs/CitadelCredentials.md)
 - [RebillySdk::Clearhaus](docs/Clearhaus.md)
 - [RebillySdk::Clearhaus3dsServer](docs/Clearhaus3dsServer.md)
 - [RebillySdk::Clearhaus3dsServers](docs/Clearhaus3dsServers.md)
 - [RebillySdk::ClearhausCredentials](docs/ClearhausCredentials.md)
 - [RebillySdk::CoinGate](docs/CoinGate.md)
 - [RebillySdk::CoinGateCredentials](docs/CoinGateCredentials.md)
 - [RebillySdk::CoinGateSettings](docs/CoinGateSettings.md)
 - [RebillySdk::CoinPayments](docs/CoinPayments.md)
 - [RebillySdk::CoinPaymentsCredentials](docs/CoinPaymentsCredentials.md)
 - [RebillySdk::CommonAlternativeInstrument](docs/CommonAlternativeInstrument.md)
 - [RebillySdk::CommonBankAccount](docs/CommonBankAccount.md)
 - [RebillySdk::CommonInvoice](docs/CommonInvoice.md)
 - [RebillySdk::CommonKycDocument](docs/CommonKycDocument.md)
 - [RebillySdk::CommonKycRequest](docs/CommonKycRequest.md)
 - [RebillySdk::CommonKycRequestDocuments](docs/CommonKycRequestDocuments.md)
 - [RebillySdk::CommonOneTimeOrder](docs/CommonOneTimeOrder.md)
 - [RebillySdk::CommonOrder](docs/CommonOrder.md)
 - [RebillySdk::CommonOrderItems](docs/CommonOrderItems.md)
 - [RebillySdk::CommonOrderPreview](docs/CommonOrderPreview.md)
 - [RebillySdk::CommonOrderPreviewDiscounts](docs/CommonOrderPreviewDiscounts.md)
 - [RebillySdk::CommonOrderPreviewItems](docs/CommonOrderPreviewItems.md)
 - [RebillySdk::CommonOrderPreviewLineItems](docs/CommonOrderPreviewLineItems.md)
 - [RebillySdk::CommonOrderPreviewTaxes](docs/CommonOrderPreviewTaxes.md)
 - [RebillySdk::CommonPayPalAccount](docs/CommonPayPalAccount.md)
 - [RebillySdk::CommonPaymentCard](docs/CommonPaymentCard.md)
 - [RebillySdk::CommonPaymentToken](docs/CommonPaymentToken.md)
 - [RebillySdk::CommonPlan](docs/CommonPlan.md)
 - [RebillySdk::CommonPlanSetup](docs/CommonPlanSetup.md)
 - [RebillySdk::CommonPlanTrial](docs/CommonPlanTrial.md)
 - [RebillySdk::CommonProduct](docs/CommonProduct.md)
 - [RebillySdk::CommonScheduleInstruction](docs/CommonScheduleInstruction.md)
 - [RebillySdk::CommonSubscriptionOrder](docs/CommonSubscriptionOrder.md)
 - [RebillySdk::CommonSubscriptionOrderLineItemSubtotal](docs/CommonSubscriptionOrderLineItemSubtotal.md)
 - [RebillySdk::CommonSubscriptionOrderRecurringInterval](docs/CommonSubscriptionOrderRecurringInterval.md)
 - [RebillySdk::CommonSubscriptionOrderTrial](docs/CommonSubscriptionOrderTrial.md)
 - [RebillySdk::CommonTransaction](docs/CommonTransaction.md)
 - [RebillySdk::CommonTransactionRequest](docs/CommonTransactionRequest.md)
 - [RebillySdk::CompositeToken](docs/CompositeToken.md)
 - [RebillySdk::Conekta](docs/Conekta.md)
 - [RebillySdk::ConektaCredentials](docs/ConektaCredentials.md)
 - [RebillySdk::ContactEmails](docs/ContactEmails.md)
 - [RebillySdk::ContactEmailsInner](docs/ContactEmailsInner.md)
 - [RebillySdk::ContactObject](docs/ContactObject.md)
 - [RebillySdk::ContactPhoneNumbers](docs/ContactPhoneNumbers.md)
 - [RebillySdk::ContactPhoneNumbersInner](docs/ContactPhoneNumbersInner.md)
 - [RebillySdk::Coppr](docs/Coppr.md)
 - [RebillySdk::CopprCredentials](docs/CopprCredentials.md)
 - [RebillySdk::CopprSettings](docs/CopprSettings.md)
 - [RebillySdk::CoreReadyToPay](docs/CoreReadyToPay.md)
 - [RebillySdk::Coupon](docs/Coupon.md)
 - [RebillySdk::CouponExpiration](docs/CouponExpiration.md)
 - [RebillySdk::CouponRedemption](docs/CouponRedemption.md)
 - [RebillySdk::CouponRestriction](docs/CouponRestriction.md)
 - [RebillySdk::Credential](docs/Credential.md)
 - [RebillySdk::Credorax](docs/Credorax.md)
 - [RebillySdk::CredoraxCredentials](docs/CredoraxCredentials.md)
 - [RebillySdk::Cryptonator](docs/Cryptonator.md)
 - [RebillySdk::CryptonatorCredentials](docs/CryptonatorCredentials.md)
 - [RebillySdk::CurrencyCode](docs/CurrencyCode.md)
 - [RebillySdk::CustomEventScheduleInstruction](docs/CustomEventScheduleInstruction.md)
 - [RebillySdk::CustomField](docs/CustomField.md)
 - [RebillySdk::Customer](docs/Customer.md)
 - [RebillySdk::CustomerAverageValue](docs/CustomerAverageValue.md)
 - [RebillySdk::CustomerEmbed](docs/CustomerEmbed.md)
 - [RebillySdk::CustomerJWT](docs/CustomerJWT.md)
 - [RebillySdk::CustomerLifetimeRevenue](docs/CustomerLifetimeRevenue.md)
 - [RebillySdk::CustomerLink](docs/CustomerLink.md)
 - [RebillySdk::CustomerTimeline](docs/CustomerTimeline.md)
 - [RebillySdk::CustomerTimelineCustomEvent](docs/CustomerTimelineCustomEvent.md)
 - [RebillySdk::CyberSource](docs/CyberSource.md)
 - [RebillySdk::CyberSourceCredentials](docs/CyberSourceCredentials.md)
 - [RebillySdk::DLocal](docs/DLocal.md)
 - [RebillySdk::DLocalCredentials](docs/DLocalCredentials.md)
 - [RebillySdk::DLocalSettings](docs/DLocalSettings.md)
 - [RebillySdk::DataCash](docs/DataCash.md)
 - [RebillySdk::DataCash3dsServer](docs/DataCash3dsServer.md)
 - [RebillySdk::DataCash3dsServers](docs/DataCash3dsServers.md)
 - [RebillySdk::DataCashCredentials](docs/DataCashCredentials.md)
 - [RebillySdk::DataCashSettings](docs/DataCashSettings.md)
 - [RebillySdk::DateInterval](docs/DateInterval.md)
 - [RebillySdk::DayOfMonth](docs/DayOfMonth.md)
 - [RebillySdk::DayOfWeek](docs/DayOfWeek.md)
 - [RebillySdk::DayOfWeekLong](docs/DayOfWeekLong.md)
 - [RebillySdk::DefaultPaymentInstrumentLink](docs/DefaultPaymentInstrumentLink.md)
 - [RebillySdk::Dengi](docs/Dengi.md)
 - [RebillySdk::DengiCredentials](docs/DengiCredentials.md)
 - [RebillySdk::DetailedProblem](docs/DetailedProblem.md)
 - [RebillySdk::DigitalWalletToken](docs/DigitalWalletToken.md)
 - [RebillySdk::DigitalWalletTokenPaymentInstrument](docs/DigitalWalletTokenPaymentInstrument.md)
 - [RebillySdk::DigitalWalletValidation](docs/DigitalWalletValidation.md)
 - [RebillySdk::DigitalWallets](docs/DigitalWallets.md)
 - [RebillySdk::DigitalWalletsApplePay](docs/DigitalWalletsApplePay.md)
 - [RebillySdk::DigitalWalletsGooglePay](docs/DigitalWalletsGooglePay.md)
 - [RebillySdk::Dimoco](docs/Dimoco.md)
 - [RebillySdk::DimocoCredentials](docs/DimocoCredentials.md)
 - [RebillySdk::Directa24](docs/Directa24.md)
 - [RebillySdk::Directa24Banks](docs/Directa24Banks.md)
 - [RebillySdk::Directa24Credentials](docs/Directa24Credentials.md)
 - [RebillySdk::Directa24Settings](docs/Directa24Settings.md)
 - [RebillySdk::Discount](docs/Discount.md)
 - [RebillySdk::DiscountAmountRemaining](docs/DiscountAmountRemaining.md)
 - [RebillySdk::DiscountContext](docs/DiscountContext.md)
 - [RebillySdk::DiscountsPerRedemption](docs/DiscountsPerRedemption.md)
 - [RebillySdk::Dispute](docs/Dispute.md)
 - [RebillySdk::DisputeLink](docs/DisputeLink.md)
 - [RebillySdk::DocumentedProblem](docs/DocumentedProblem.md)
 - [RebillySdk::Dragonphoenix](docs/Dragonphoenix.md)
 - [RebillySdk::DragonphoenixCredentials](docs/DragonphoenixCredentials.md)
 - [RebillySdk::DueTimeShiftInstruction](docs/DueTimeShiftInstruction.md)
 - [RebillySdk::DynamicIpnLink](docs/DynamicIpnLink.md)
 - [RebillySdk::EBANX](docs/EBANX.md)
 - [RebillySdk::EBANXCredentials](docs/EBANXCredentials.md)
 - [RebillySdk::EMS](docs/EMS.md)
 - [RebillySdk::EMS3dsServers](docs/EMS3dsServers.md)
 - [RebillySdk::EMSCredentials](docs/EMSCredentials.md)
 - [RebillySdk::EMSSettings](docs/EMSSettings.md)
 - [RebillySdk::EMerchantPay](docs/EMerchantPay.md)
 - [RebillySdk::EMerchantPay3dsServer](docs/EMerchantPay3dsServer.md)
 - [RebillySdk::EMerchantPay3dsServers](docs/EMerchantPay3dsServers.md)
 - [RebillySdk::EMerchantPayCredentials](docs/EMerchantPayCredentials.md)
 - [RebillySdk::EMerchantPaySettings](docs/EMerchantPaySettings.md)
 - [RebillySdk::EPG](docs/EPG.md)
 - [RebillySdk::EPGCredentials](docs/EPGCredentials.md)
 - [RebillySdk::EPro](docs/EPro.md)
 - [RebillySdk::EProCredentials](docs/EProCredentials.md)
 - [RebillySdk::EZeeWallet](docs/EZeeWallet.md)
 - [RebillySdk::EZeeWalletCredentials](docs/EZeeWalletCredentials.md)
 - [RebillySdk::EcoPayz](docs/EcoPayz.md)
 - [RebillySdk::EcoPayzCredentials](docs/EcoPayzCredentials.md)
 - [RebillySdk::EcoPayzSettings](docs/EcoPayzSettings.md)
 - [RebillySdk::EcorePay](docs/EcorePay.md)
 - [RebillySdk::EcorePayCredentials](docs/EcorePayCredentials.md)
 - [RebillySdk::Elavon](docs/Elavon.md)
 - [RebillySdk::ElavonCredentials](docs/ElavonCredentials.md)
 - [RebillySdk::Error](docs/Error.md)
 - [RebillySdk::Euteller](docs/Euteller.md)
 - [RebillySdk::EutellerCredentials](docs/EutellerCredentials.md)
 - [RebillySdk::ExtraData](docs/ExtraData.md)
 - [RebillySdk::EzyEFT](docs/EzyEFT.md)
 - [RebillySdk::EzyEFTCredentials](docs/EzyEFTCredentials.md)
 - [RebillySdk::Fee](docs/Fee.md)
 - [RebillySdk::FeeFormula](docs/FeeFormula.md)
 - [RebillySdk::FeePatch](docs/FeePatch.md)
 - [RebillySdk::File](docs/File.md)
 - [RebillySdk::FileCreateFromInline](docs/FileCreateFromInline.md)
 - [RebillySdk::FileCreateFromUrl](docs/FileCreateFromUrl.md)
 - [RebillySdk::FileDownloadLink](docs/FileDownloadLink.md)
 - [RebillySdk::FileEmbed](docs/FileEmbed.md)
 - [RebillySdk::FileLink](docs/FileLink.md)
 - [RebillySdk::FilesBody](docs/FilesBody.md)
 - [RebillySdk::FilterString](docs/FilterString.md)
 - [RebillySdk::FinTecSystems](docs/FinTecSystems.md)
 - [RebillySdk::FinTecSystemsCredentials](docs/FinTecSystemsCredentials.md)
 - [RebillySdk::FinTecSystemsSettings](docs/FinTecSystemsSettings.md)
 - [RebillySdk::Finrax](docs/Finrax.md)
 - [RebillySdk::FinraxCredentials](docs/FinraxCredentials.md)
 - [RebillySdk::FinraxSettings](docs/FinraxSettings.md)
 - [RebillySdk::Fixed](docs/Fixed.md)
 - [RebillySdk::FixedFee](docs/FixedFee.md)
 - [RebillySdk::FixedFeeFormula](docs/FixedFeeFormula.md)
 - [RebillySdk::FlatRate](docs/FlatRate.md)
 - [RebillySdk::Flexepin](docs/Flexepin.md)
 - [RebillySdk::FlexepinCredentials](docs/FlexepinCredentials.md)
 - [RebillySdk::FlexiblePlan](docs/FlexiblePlan.md)
 - [RebillySdk::Forte](docs/Forte.md)
 - [RebillySdk::ForteCredentials](docs/ForteCredentials.md)
 - [RebillySdk::FullPaymentCardToken](docs/FullPaymentCardToken.md)
 - [RebillySdk::FullPaymentCardTokenPaymentInstrument](docs/FullPaymentCardTokenPaymentInstrument.md)
 - [RebillySdk::FundSend](docs/FundSend.md)
 - [RebillySdk::FundSendCredentials](docs/FundSendCredentials.md)
 - [RebillySdk::GET](docs/GET.md)
 - [RebillySdk::GET3dsServers](docs/GET3dsServers.md)
 - [RebillySdk::GETCredentials](docs/GETCredentials.md)
 - [RebillySdk::GatewayAccount](docs/GatewayAccount.md)
 - [RebillySdk::GatewayAccountEmbed](docs/GatewayAccountEmbed.md)
 - [RebillySdk::GatewayAccountLimit](docs/GatewayAccountLimit.md)
 - [RebillySdk::GatewayAccountLimitLink](docs/GatewayAccountLimitLink.md)
 - [RebillySdk::GatewayAccountLink](docs/GatewayAccountLink.md)
 - [RebillySdk::GatewayName](docs/GatewayName.md)
 - [RebillySdk::Gigadat](docs/Gigadat.md)
 - [RebillySdk::GigadatCredentials](docs/GigadatCredentials.md)
 - [RebillySdk::GigadatSettings](docs/GigadatSettings.md)
 - [RebillySdk::GlobalOne](docs/GlobalOne.md)
 - [RebillySdk::GlobalOneCredentials](docs/GlobalOneCredentials.md)
 - [RebillySdk::GlobalWebhookEventType](docs/GlobalWebhookEventType.md)
 - [RebillySdk::GooglePayFeature](docs/GooglePayFeature.md)
 - [RebillySdk::GooglePayFeatureName](docs/GooglePayFeatureName.md)
 - [RebillySdk::Gooney](docs/Gooney.md)
 - [RebillySdk::GooneyCredentials](docs/GooneyCredentials.md)
 - [RebillySdk::Gpaysafe](docs/Gpaysafe.md)
 - [RebillySdk::GpaysafeCredentials](docs/GpaysafeCredentials.md)
 - [RebillySdk::Greenbox](docs/Greenbox.md)
 - [RebillySdk::GreenboxCredentials](docs/GreenboxCredentials.md)
 - [RebillySdk::HiPay](docs/HiPay.md)
 - [RebillySdk::HiPayCredentials](docs/HiPayCredentials.md)
 - [RebillySdk::HttpHeaders](docs/HttpHeaders.md)
 - [RebillySdk::IBANInstrument](docs/IBANInstrument.md)
 - [RebillySdk::IBANType](docs/IBANType.md)
 - [RebillySdk::ICEPAY](docs/ICEPAY.md)
 - [RebillySdk::ICEPAYCredentials](docs/ICEPAYCredentials.md)
 - [RebillySdk::ICanPay](docs/ICanPay.md)
 - [RebillySdk::ICanPayCredentials](docs/ICanPayCredentials.md)
 - [RebillySdk::ICheque](docs/ICheque.md)
 - [RebillySdk::IChequeCredentials](docs/IChequeCredentials.md)
 - [RebillySdk::IDebit](docs/IDebit.md)
 - [RebillySdk::IDebitCredentials](docs/IDebitCredentials.md)
 - [RebillySdk::INOVAPAY](docs/INOVAPAY.md)
 - [RebillySdk::INOVAPAYCredentials](docs/INOVAPAYCredentials.md)
 - [RebillySdk::IdMatchesBody](docs/IdMatchesBody.md)
 - [RebillySdk::IdentityMatches](docs/IdentityMatches.md)
 - [RebillySdk::Ilixium](docs/Ilixium.md)
 - [RebillySdk::Ilixium3dsServer](docs/Ilixium3dsServer.md)
 - [RebillySdk::Ilixium3dsServers](docs/Ilixium3dsServers.md)
 - [RebillySdk::IlixiumCredentials](docs/IlixiumCredentials.md)
 - [RebillySdk::IlixiumSettings](docs/IlixiumSettings.md)
 - [RebillySdk::Immediately](docs/Immediately.md)
 - [RebillySdk::Ingenico](docs/Ingenico.md)
 - [RebillySdk::Ingenico3dsServer](docs/Ingenico3dsServer.md)
 - [RebillySdk::Ingenico3dsServers](docs/Ingenico3dsServers.md)
 - [RebillySdk::IngenicoCredentials](docs/IngenicoCredentials.md)
 - [RebillySdk::InitialInvoiceEmbed](docs/InitialInvoiceEmbed.md)
 - [RebillySdk::InitialInvoiceLink](docs/InitialInvoiceLink.md)
 - [RebillySdk::Inovio](docs/Inovio.md)
 - [RebillySdk::Inovio3dsServer](docs/Inovio3dsServer.md)
 - [RebillySdk::Inovio3dsServers](docs/Inovio3dsServers.md)
 - [RebillySdk::InovioCredentials](docs/InovioCredentials.md)
 - [RebillySdk::InovioSettings](docs/InovioSettings.md)
 - [RebillySdk::InstaDebit](docs/InstaDebit.md)
 - [RebillySdk::InstaDebitCredentials](docs/InstaDebitCredentials.md)
 - [RebillySdk::InstaDebitSettings](docs/InstaDebitSettings.md)
 - [RebillySdk::InstrumentReference](docs/InstrumentReference.md)
 - [RebillySdk::Intuit](docs/Intuit.md)
 - [RebillySdk::IntuitCredentials](docs/IntuitCredentials.md)
 - [RebillySdk::InvalidError](docs/InvalidError.md)
 - [RebillySdk::Invoice](docs/Invoice.md)
 - [RebillySdk::InvoiceDiscount](docs/InvoiceDiscount.md)
 - [RebillySdk::InvoiceIssue](docs/InvoiceIssue.md)
 - [RebillySdk::InvoiceItem](docs/InvoiceItem.md)
 - [RebillySdk::InvoiceLink](docs/InvoiceLink.md)
 - [RebillySdk::InvoiceReissue](docs/InvoiceReissue.md)
 - [RebillySdk::InvoiceRetryAmountAdjustmentInstruction](docs/InvoiceRetryAmountAdjustmentInstruction.md)
 - [RebillySdk::InvoiceRetryInstruction](docs/InvoiceRetryInstruction.md)
 - [RebillySdk::InvoiceRetryInstructionAttempts](docs/InvoiceRetryInstructionAttempts.md)
 - [RebillySdk::InvoiceRetryScheduleInstruction](docs/InvoiceRetryScheduleInstruction.md)
 - [RebillySdk::InvoiceTax](docs/InvoiceTax.md)
 - [RebillySdk::InvoiceTaxItem](docs/InvoiceTaxItem.md)
 - [RebillySdk::InvoiceTimeShift](docs/InvoiceTimeShift.md)
 - [RebillySdk::InvoiceTimeline](docs/InvoiceTimeline.md)
 - [RebillySdk::InvoiceTransaction](docs/InvoiceTransaction.md)
 - [RebillySdk::InvoiceTransactionAllocation](docs/InvoiceTransactionAllocation.md)
 - [RebillySdk::InvoicesEmbed](docs/InvoicesEmbed.md)
 - [RebillySdk::InvoicesLink](docs/InvoicesLink.md)
 - [RebillySdk::IpayOptions](docs/IpayOptions.md)
 - [RebillySdk::IpayOptionsCredentials](docs/IpayOptionsCredentials.md)
 - [RebillySdk::IpayOptionsSettings](docs/IpayOptionsSettings.md)
 - [RebillySdk::IssueTimeShiftInstruction](docs/IssueTimeShiftInstruction.md)
 - [RebillySdk::JetPay](docs/JetPay.md)
 - [RebillySdk::JetPayCredentials](docs/JetPayCredentials.md)
 - [RebillySdk::Jeton](docs/Jeton.md)
 - [RebillySdk::JetonCredentials](docs/JetonCredentials.md)
 - [RebillySdk::JetonSettings](docs/JetonSettings.md)
 - [RebillySdk::Khelocard](docs/Khelocard.md)
 - [RebillySdk::KhelocardCard](docs/KhelocardCard.md)
 - [RebillySdk::KhelocardCardToken](docs/KhelocardCardToken.md)
 - [RebillySdk::KhelocardCardTokenPaymentInstrument](docs/KhelocardCardTokenPaymentInstrument.md)
 - [RebillySdk::KhelocardCredentials](docs/KhelocardCredentials.md)
 - [RebillySdk::Konnektive](docs/Konnektive.md)
 - [RebillySdk::KonnektiveCredentials](docs/KonnektiveCredentials.md)
 - [RebillySdk::KonnektiveSettings](docs/KonnektiveSettings.md)
 - [RebillySdk::KycDocument](docs/KycDocument.md)
 - [RebillySdk::KycDocument2](docs/KycDocument2.md)
 - [RebillySdk::KycDocumentLink](docs/KycDocumentLink.md)
 - [RebillySdk::KycDocumentRejection](docs/KycDocumentRejection.md)
 - [RebillySdk::KycDocumentSubtypes](docs/KycDocumentSubtypes.md)
 - [RebillySdk::KycDocumentTypes](docs/KycDocumentTypes.md)
 - [RebillySdk::KycDocumentsLink](docs/KycDocumentsLink.md)
 - [RebillySdk::KycGathererLink](docs/KycGathererLink.md)
 - [RebillySdk::KycRequest](docs/KycRequest.md)
 - [RebillySdk::KycSettingsAddress](docs/KycSettingsAddress.md)
 - [RebillySdk::KycSettingsAddressWeights](docs/KycSettingsAddressWeights.md)
 - [RebillySdk::KycSettingsIdentity](docs/KycSettingsIdentity.md)
 - [RebillySdk::KycSettingsIdentityThresholds](docs/KycSettingsIdentityThresholds.md)
 - [RebillySdk::KycSettingsIdentityWeights](docs/KycSettingsIdentityWeights.md)
 - [RebillySdk::LPG](docs/LPG.md)
 - [RebillySdk::LPGCredentials](docs/LPGCredentials.md)
 - [RebillySdk::LanguageIsoCode](docs/LanguageIsoCode.md)
 - [RebillySdk::LeadSource](docs/LeadSource.md)
 - [RebillySdk::LeadSourceData](docs/LeadSourceData.md)
 - [RebillySdk::LeadSourceEmbed](docs/LeadSourceEmbed.md)
 - [RebillySdk::LeadSourceLink](docs/LeadSourceLink.md)
 - [RebillySdk::Link](docs/Link.md)
 - [RebillySdk::List](docs/List.md)
 - [RebillySdk::Loonie](docs/Loonie.md)
 - [RebillySdk::LoonieCredentials](docs/LoonieCredentials.md)
 - [RebillySdk::Manual](docs/Manual.md)
 - [RebillySdk::Manual2](docs/Manual2.md)
 - [RebillySdk::MaxiCash](docs/MaxiCash.md)
 - [RebillySdk::MaxiCashCredentials](docs/MaxiCashCredentials.md)
 - [RebillySdk::MiFinity](docs/MiFinity.md)
 - [RebillySdk::MiFinityCredentials](docs/MiFinityCredentials.md)
 - [RebillySdk::MinimumOrderAmount](docs/MinimumOrderAmount.md)
 - [RebillySdk::Moneris](docs/Moneris.md)
 - [RebillySdk::MonerisCredentials](docs/MonerisCredentials.md)
 - [RebillySdk::Money](docs/Money.md)
 - [RebillySdk::MoneyAmount](docs/MoneyAmount.md)
 - [RebillySdk::MtaPay](docs/MtaPay.md)
 - [RebillySdk::MtaPayCredentials](docs/MtaPayCredentials.md)
 - [RebillySdk::MtaPaySettings](docs/MtaPaySettings.md)
 - [RebillySdk::MuchBetter](docs/MuchBetter.md)
 - [RebillySdk::MuchBetterCredentials](docs/MuchBetterCredentials.md)
 - [RebillySdk::MuchBetterSettings](docs/MuchBetterSettings.md)
 - [RebillySdk::MyFatoorah](docs/MyFatoorah.md)
 - [RebillySdk::MyFatoorahCredentials](docs/MyFatoorahCredentials.md)
 - [RebillySdk::NGenius](docs/NGenius.md)
 - [RebillySdk::NGenius3dsServer](docs/NGenius3dsServer.md)
 - [RebillySdk::NGenius3dsServers](docs/NGenius3dsServers.md)
 - [RebillySdk::NGeniusCredentials](docs/NGeniusCredentials.md)
 - [RebillySdk::NMI](docs/NMI.md)
 - [RebillySdk::NMI3dsServers](docs/NMI3dsServers.md)
 - [RebillySdk::NMICredentials](docs/NMICredentials.md)
 - [RebillySdk::NMISettings](docs/NMISettings.md)
 - [RebillySdk::Neosurf](docs/Neosurf.md)
 - [RebillySdk::NeosurfCredentials](docs/NeosurfCredentials.md)
 - [RebillySdk::Netbanking](docs/Netbanking.md)
 - [RebillySdk::NetbankingCredentials](docs/NetbankingCredentials.md)
 - [RebillySdk::Neteller](docs/Neteller.md)
 - [RebillySdk::NetellerCredentials](docs/NetellerCredentials.md)
 - [RebillySdk::NetellerSettings](docs/NetellerSettings.md)
 - [RebillySdk::NinjaWallet](docs/NinjaWallet.md)
 - [RebillySdk::NinjaWalletCredentials](docs/NinjaWalletCredentials.md)
 - [RebillySdk::None](docs/None.md)
 - [RebillySdk::NuaPay](docs/NuaPay.md)
 - [RebillySdk::NuaPayCredentials](docs/NuaPayCredentials.md)
 - [RebillySdk::OchaPay](docs/OchaPay.md)
 - [RebillySdk::OchaPayCredentials](docs/OchaPayCredentials.md)
 - [RebillySdk::OnBoardingUrlLink](docs/OnBoardingUrlLink.md)
 - [RebillySdk::OnRamp](docs/OnRamp.md)
 - [RebillySdk::OnRampCredentials](docs/OnRampCredentials.md)
 - [RebillySdk::OneColumn](docs/OneColumn.md)
 - [RebillySdk::OneOfCommonOrderItemsPlan](docs/OneOfCommonOrderItemsPlan.md)
 - [RebillySdk::OneOfDueTimeShiftInstructionUnit](docs/OneOfDueTimeShiftInstructionUnit.md)
 - [RebillySdk::OneOfIssueTimeShiftInstructionUnit](docs/OneOfIssueTimeShiftInstructionUnit.md)
 - [RebillySdk::OneOfKycDocument2](docs/OneOfKycDocument2.md)
 - [RebillySdk::OneOfPaymentInstruction](docs/OneOfPaymentInstruction.md)
 - [RebillySdk::OneOfPaymentInstrument2](docs/OneOfPaymentInstrument2.md)
 - [RebillySdk::OneOfReadyToPay](docs/OneOfReadyToPay.md)
 - [RebillySdk::OneOfReadyToPayAchMethodFeature](docs/OneOfReadyToPayAchMethodFeature.md)
 - [RebillySdk::OneOfReadyToPayPayPalMethodFeature](docs/OneOfReadyToPayPayPalMethodFeature.md)
 - [RebillySdk::OneOfReadyToPayPaymentCardMethodFeature](docs/OneOfReadyToPayPaymentCardMethodFeature.md)
 - [RebillySdk::OneOfSubscriptionChangeItemsPlan](docs/OneOfSubscriptionChangeItemsPlan.md)
 - [RebillySdk::OneOffilesBody](docs/OneOffilesBody.md)
 - [RebillySdk::OneTimeOrder](docs/OneTimeOrder.md)
 - [RebillySdk::Onlineueberweisen](docs/Onlineueberweisen.md)
 - [RebillySdk::OnlineueberweisenCredentials](docs/OnlineueberweisenCredentials.md)
 - [RebillySdk::OnlineueberweisenSettings](docs/OnlineueberweisenSettings.md)
 - [RebillySdk::OrderPreview](docs/OrderPreview.md)
 - [RebillySdk::OrderTimeline](docs/OrderTimeline.md)
 - [RebillySdk::Organization](docs/Organization.md)
 - [RebillySdk::OrganizationEmbed](docs/OrganizationEmbed.md)
 - [RebillySdk::OrganizationLink](docs/OrganizationLink.md)
 - [RebillySdk::OrganizationQuestionnaire](docs/OrganizationQuestionnaire.md)
 - [RebillySdk::OrganizationSettings](docs/OrganizationSettings.md)
 - [RebillySdk::OrganizationSettingsDefaultTaxCalculator](docs/OrganizationSettingsDefaultTaxCalculator.md)
 - [RebillySdk::OrganizationSettingsKyc](docs/OrganizationSettingsKyc.md)
 - [RebillySdk::OriginalPlan](docs/OriginalPlan.md)
 - [RebillySdk::Other](docs/Other.md)
 - [RebillySdk::PPRO](docs/PPRO.md)
 - [RebillySdk::PPROCredentials](docs/PPROCredentials.md)
 - [RebillySdk::Pagsmile](docs/Pagsmile.md)
 - [RebillySdk::PagsmileCredentials](docs/PagsmileCredentials.md)
 - [RebillySdk::PaidByTime](docs/PaidByTime.md)
 - [RebillySdk::Panamerican](docs/Panamerican.md)
 - [RebillySdk::Panamerican3dsServer](docs/Panamerican3dsServer.md)
 - [RebillySdk::Panamerican3dsServers](docs/Panamerican3dsServers.md)
 - [RebillySdk::PanamericanCredentials](docs/PanamericanCredentials.md)
 - [RebillySdk::PanamericanSettings](docs/PanamericanSettings.md)
 - [RebillySdk::PandaGateway](docs/PandaGateway.md)
 - [RebillySdk::PandaGatewayCredentials](docs/PandaGatewayCredentials.md)
 - [RebillySdk::ParamountEft](docs/ParamountEft.md)
 - [RebillySdk::ParamountEftCredentials](docs/ParamountEftCredentials.md)
 - [RebillySdk::ParamountInterac](docs/ParamountInterac.md)
 - [RebillySdk::ParamountInteracCredentials](docs/ParamountInteracCredentials.md)
 - [RebillySdk::ParamountInteracSettings](docs/ParamountInteracSettings.md)
 - [RebillySdk::ParentTransactionEmbed](docs/ParentTransactionEmbed.md)
 - [RebillySdk::ParentTransactionLink](docs/ParentTransactionLink.md)
 - [RebillySdk::Partial](docs/Partial.md)
 - [RebillySdk::PartialPaymentCardToken](docs/PartialPaymentCardToken.md)
 - [RebillySdk::PartialPaymentCardTokenPaymentInstrument](docs/PartialPaymentCardTokenPaymentInstrument.md)
 - [RebillySdk::Password](docs/Password.md)
 - [RebillySdk::Passwordless](docs/Passwordless.md)
 - [RebillySdk::Pay4Fun](docs/Pay4Fun.md)
 - [RebillySdk::Pay4FunCredentials](docs/Pay4FunCredentials.md)
 - [RebillySdk::PayCash](docs/PayCash.md)
 - [RebillySdk::PayCashCredentials](docs/PayCashCredentials.md)
 - [RebillySdk::PayClub](docs/PayClub.md)
 - [RebillySdk::PayClubCredentials](docs/PayClubCredentials.md)
 - [RebillySdk::PayClubSettings](docs/PayClubSettings.md)
 - [RebillySdk::PayPal](docs/PayPal.md)
 - [RebillySdk::PayPalAccount](docs/PayPalAccount.md)
 - [RebillySdk::PayPalBillingAgreementFeature](docs/PayPalBillingAgreementFeature.md)
 - [RebillySdk::PayPalBillingAgreementFeatureName](docs/PayPalBillingAgreementFeatureName.md)
 - [RebillySdk::PayPalSettings](docs/PayPalSettings.md)
 - [RebillySdk::PayPalToken](docs/PayPalToken.md)
 - [RebillySdk::PayPalTokenPaymentInstrument](docs/PayPalTokenPaymentInstrument.md)
 - [RebillySdk::PayTabs](docs/PayTabs.md)
 - [RebillySdk::PayTabsCredentials](docs/PayTabsCredentials.md)
 - [RebillySdk::PayULatam](docs/PayULatam.md)
 - [RebillySdk::PayULatamCredentials](docs/PayULatamCredentials.md)
 - [RebillySdk::Payeezy](docs/Payeezy.md)
 - [RebillySdk::PayeezyCredentials](docs/PayeezyCredentials.md)
 - [RebillySdk::Payflow](docs/Payflow.md)
 - [RebillySdk::PayflowCredentials](docs/PayflowCredentials.md)
 - [RebillySdk::PaymenTechnologies](docs/PaymenTechnologies.md)
 - [RebillySdk::PaymenTechnologiesCredentials](docs/PaymenTechnologiesCredentials.md)
 - [RebillySdk::PaymentAsia](docs/PaymentAsia.md)
 - [RebillySdk::PaymentAsiaCredentials](docs/PaymentAsiaCredentials.md)
 - [RebillySdk::PaymentCard](docs/PaymentCard.md)
 - [RebillySdk::PaymentCardBrand](docs/PaymentCardBrand.md)
 - [RebillySdk::PaymentCardCreatePlain](docs/PaymentCardCreatePlain.md)
 - [RebillySdk::PaymentCardEmbed](docs/PaymentCardEmbed.md)
 - [RebillySdk::PaymentCardLink](docs/PaymentCardLink.md)
 - [RebillySdk::PaymentCardUpdatePlain](docs/PaymentCardUpdatePlain.md)
 - [RebillySdk::PaymentInstruction](docs/PaymentInstruction.md)
 - [RebillySdk::PaymentInstrument](docs/PaymentInstrument.md)
 - [RebillySdk::PaymentInstrument2](docs/PaymentInstrument2.md)
 - [RebillySdk::PaymentInstrument3](docs/PaymentInstrument3.md)
 - [RebillySdk::PaymentInstrumentCreateToken](docs/PaymentInstrumentCreateToken.md)
 - [RebillySdk::PaymentInstrumentLink](docs/PaymentInstrumentLink.md)
 - [RebillySdk::PaymentInstrumentUpdateToken](docs/PaymentInstrumentUpdateToken.md)
 - [RebillySdk::PaymentMethod](docs/PaymentMethod.md)
 - [RebillySdk::PaymentMethods](docs/PaymentMethods.md)
 - [RebillySdk::PaymentToken](docs/PaymentToken.md)
 - [RebillySdk::PaymentsOS](docs/PaymentsOS.md)
 - [RebillySdk::PaymentsOSCredentials](docs/PaymentsOSCredentials.md)
 - [RebillySdk::Paymero](docs/Paymero.md)
 - [RebillySdk::PaymeroCredentials](docs/PaymeroCredentials.md)
 - [RebillySdk::PaymeroSettings](docs/PaymeroSettings.md)
 - [RebillySdk::Paynote](docs/Paynote.md)
 - [RebillySdk::PaynoteCredentials](docs/PaynoteCredentials.md)
 - [RebillySdk::PayoutRequest](docs/PayoutRequest.md)
 - [RebillySdk::Payr](docs/Payr.md)
 - [RebillySdk::PayrCredentials](docs/PayrCredentials.md)
 - [RebillySdk::Paysafe](docs/Paysafe.md)
 - [RebillySdk::Paysafe3dsServer](docs/Paysafe3dsServer.md)
 - [RebillySdk::Paysafe3dsServers](docs/Paysafe3dsServers.md)
 - [RebillySdk::PaysafeCredentials](docs/PaysafeCredentials.md)
 - [RebillySdk::Paysafecard](docs/Paysafecard.md)
 - [RebillySdk::PaysafecardCredentials](docs/PaysafecardCredentials.md)
 - [RebillySdk::Paysafecash](docs/Paysafecash.md)
 - [RebillySdk::PaysafecashCredentials](docs/PaysafecashCredentials.md)
 - [RebillySdk::Payvision](docs/Payvision.md)
 - [RebillySdk::Payvision3dsServer](docs/Payvision3dsServer.md)
 - [RebillySdk::Payvision3dsServers](docs/Payvision3dsServers.md)
 - [RebillySdk::PayvisionCredentials](docs/PayvisionCredentials.md)
 - [RebillySdk::PayvisionSettings](docs/PayvisionSettings.md)
 - [RebillySdk::Percent](docs/Percent.md)
 - [RebillySdk::PercentageFormula](docs/PercentageFormula.md)
 - [RebillySdk::PermalinkLink](docs/PermalinkLink.md)
 - [RebillySdk::Piastrix](docs/Piastrix.md)
 - [RebillySdk::Piastrix3dsServer](docs/Piastrix3dsServer.md)
 - [RebillySdk::Piastrix3dsServers](docs/Piastrix3dsServers.md)
 - [RebillySdk::PiastrixCredentials](docs/PiastrixCredentials.md)
 - [RebillySdk::PiastrixSettings](docs/PiastrixSettings.md)
 - [RebillySdk::PlaidAccountToken](docs/PlaidAccountToken.md)
 - [RebillySdk::PlaidAccountTokenPaymentInstrument](docs/PlaidAccountTokenPaymentInstrument.md)
 - [RebillySdk::PlaidFeatureName](docs/PlaidFeatureName.md)
 - [RebillySdk::Plan](docs/Plan.md)
 - [RebillySdk::PlanBillingTiming](docs/PlanBillingTiming.md)
 - [RebillySdk::PlanEmbed](docs/PlanEmbed.md)
 - [RebillySdk::PlanPeriod](docs/PlanPeriod.md)
 - [RebillySdk::PlanPriceFormula](docs/PlanPriceFormula.md)
 - [RebillySdk::Plugnpay](docs/Plugnpay.md)
 - [RebillySdk::PlugnpayCredentials](docs/PlugnpayCredentials.md)
 - [RebillySdk::PostFinance](docs/PostFinance.md)
 - [RebillySdk::PostFinanceCredentials](docs/PostFinanceCredentials.md)
 - [RebillySdk::PostFinanceSettings](docs/PostFinanceSettings.md)
 - [RebillySdk::PriceBasedShippingRate](docs/PriceBasedShippingRate.md)
 - [RebillySdk::Problem](docs/Problem.md)
 - [RebillySdk::Product](docs/Product.md)
 - [RebillySdk::ProductEmbed](docs/ProductEmbed.md)
 - [RebillySdk::ProductLink](docs/ProductLink.md)
 - [RebillySdk::ProofOfAddress](docs/ProofOfAddress.md)
 - [RebillySdk::ProofOfAddressDocumentMatches](docs/ProofOfAddressDocumentMatches.md)
 - [RebillySdk::ProofOfFunds](docs/ProofOfFunds.md)
 - [RebillySdk::ProofOfIdentity](docs/ProofOfIdentity.md)
 - [RebillySdk::ProofOfIdentityDocumentMatches](docs/ProofOfIdentityDocumentMatches.md)
 - [RebillySdk::ProofOfPurchase](docs/ProofOfPurchase.md)
 - [RebillySdk::ProofOfPurchaseDocumentMatches](docs/ProofOfPurchaseDocumentMatches.md)
 - [RebillySdk::Prosa](docs/Prosa.md)
 - [RebillySdk::Prosa3dsServers](docs/Prosa3dsServers.md)
 - [RebillySdk::ProsaCredentials](docs/ProsaCredentials.md)
 - [RebillySdk::PurchaseBumpOffer](docs/PurchaseBumpOffer.md)
 - [RebillySdk::PurchaseBumpOfferList](docs/PurchaseBumpOfferList.md)
 - [RebillySdk::PurchaseBumpSplitVersionName](docs/PurchaseBumpSplitVersionName.md)
 - [RebillySdk::PurchaseBumpStatus](docs/PurchaseBumpStatus.md)
 - [RebillySdk::PurchaseMatches](docs/PurchaseMatches.md)
 - [RebillySdk::QueryUrlLink](docs/QueryUrlLink.md)
 - [RebillySdk::RPN](docs/RPN.md)
 - [RebillySdk::RPNCredentials](docs/RPNCredentials.md)
 - [RebillySdk::Rapyd](docs/Rapyd.md)
 - [RebillySdk::RapydCredentials](docs/RapydCredentials.md)
 - [RebillySdk::RapydSettings](docs/RapydSettings.md)
 - [RebillySdk::ReadyToPay](docs/ReadyToPay.md)
 - [RebillySdk::ReadyToPayAchMethod](docs/ReadyToPayAchMethod.md)
 - [RebillySdk::ReadyToPayAmount](docs/ReadyToPayAmount.md)
 - [RebillySdk::ReadyToPayGenericMethod](docs/ReadyToPayGenericMethod.md)
 - [RebillySdk::ReadyToPayItems](docs/ReadyToPayItems.md)
 - [RebillySdk::ReadyToPayItemsItems](docs/ReadyToPayItemsItems.md)
 - [RebillySdk::ReadyToPayMethodFilters](docs/ReadyToPayMethodFilters.md)
 - [RebillySdk::ReadyToPayMethods](docs/ReadyToPayMethods.md)
 - [RebillySdk::ReadyToPayPayPalMethod](docs/ReadyToPayPayPalMethod.md)
 - [RebillySdk::ReadyToPayPaymentCardMethod](docs/ReadyToPayPaymentCardMethod.md)
 - [RebillySdk::Realex](docs/Realex.md)
 - [RebillySdk::RealexCredentials](docs/RealexCredentials.md)
 - [RebillySdk::Realtime](docs/Realtime.md)
 - [RebillySdk::RealtimeCredentials](docs/RealtimeCredentials.md)
 - [RebillySdk::Rebilly](docs/Rebilly.md)
 - [RebillySdk::RebillyTaxjar](docs/RebillyTaxjar.md)
 - [RebillySdk::RecalculateInvoiceLink](docs/RecalculateInvoiceLink.md)
 - [RebillySdk::RecentInvoiceEmbed](docs/RecentInvoiceEmbed.md)
 - [RebillySdk::RecentInvoiceLink](docs/RecentInvoiceLink.md)
 - [RebillySdk::RedemptionCancel](docs/RedemptionCancel.md)
 - [RebillySdk::RedemptionRestriction](docs/RedemptionRestriction.md)
 - [RebillySdk::RedemptionsPerCustomer](docs/RedemptionsPerCustomer.md)
 - [RebillySdk::Redsys](docs/Redsys.md)
 - [RebillySdk::RedsysCredentials](docs/RedsysCredentials.md)
 - [RebillySdk::RefundUrlLink](docs/RefundUrlLink.md)
 - [RebillySdk::ResendEmail](docs/ResendEmail.md)
 - [RebillySdk::ResetPasswordToken](docs/ResetPasswordToken.md)
 - [RebillySdk::ResourceCustomFields](docs/ResourceCustomFields.md)
 - [RebillySdk::ResourceId](docs/ResourceId.md)
 - [RebillySdk::RestrictToCountries](docs/RestrictToCountries.md)
 - [RebillySdk::RestrictToInvoices](docs/RestrictToInvoices.md)
 - [RebillySdk::RestrictToPlans](docs/RestrictToPlans.md)
 - [RebillySdk::RestrictToProducts](docs/RestrictToProducts.md)
 - [RebillySdk::RestrictToSubscriptions](docs/RestrictToSubscriptions.md)
 - [RebillySdk::RiskMetadata](docs/RiskMetadata.md)
 - [RebillySdk::Rotessa](docs/Rotessa.md)
 - [RebillySdk::RotessaCredentials](docs/RotessaCredentials.md)
 - [RebillySdk::RotessaSettings](docs/RotessaSettings.md)
 - [RebillySdk::RulesetRestore](docs/RulesetRestore.md)
 - [RebillySdk::SMSVoucher](docs/SMSVoucher.md)
 - [RebillySdk::SMSVoucherCredentials](docs/SMSVoucherCredentials.md)
 - [RebillySdk::STPMexico](docs/STPMexico.md)
 - [RebillySdk::STPMexicoBanks](docs/STPMexicoBanks.md)
 - [RebillySdk::STPMexicoCredentials](docs/STPMexicoCredentials.md)
 - [RebillySdk::Safecharge](docs/Safecharge.md)
 - [RebillySdk::Safecharge3dsServers](docs/Safecharge3dsServers.md)
 - [RebillySdk::SafechargeCredentials](docs/SafechargeCredentials.md)
 - [RebillySdk::Sagepay](docs/Sagepay.md)
 - [RebillySdk::SagepayCredentials](docs/SagepayCredentials.md)
 - [RebillySdk::SaltarPay](docs/SaltarPay.md)
 - [RebillySdk::SaltarPayCredentials](docs/SaltarPayCredentials.md)
 - [RebillySdk::SeamlessChex](docs/SeamlessChex.md)
 - [RebillySdk::SeamlessChexCredentials](docs/SeamlessChexCredentials.md)
 - [RebillySdk::Search](docs/Search.md)
 - [RebillySdk::SecureTrading](docs/SecureTrading.md)
 - [RebillySdk::SecureTrading3dsServer](docs/SecureTrading3dsServer.md)
 - [RebillySdk::SecureTrading3dsServers](docs/SecureTrading3dsServers.md)
 - [RebillySdk::SecureTradingCredentials](docs/SecureTradingCredentials.md)
 - [RebillySdk::SecurionPay](docs/SecurionPay.md)
 - [RebillySdk::SecurionPay3dsServers](docs/SecurionPay3dsServers.md)
 - [RebillySdk::SecurionPayCredentials](docs/SecurionPayCredentials.md)
 - [RebillySdk::SelfLink](docs/SelfLink.md)
 - [RebillySdk::ServerTimestamp](docs/ServerTimestamp.md)
 - [RebillySdk::ServicePeriodAnchorInstruction](docs/ServicePeriodAnchorInstruction.md)
 - [RebillySdk::Shipping](docs/Shipping.md)
 - [RebillySdk::ShippingOption](docs/ShippingOption.md)
 - [RebillySdk::ShippingRate](docs/ShippingRate.md)
 - [RebillySdk::ShippingZone](docs/ShippingZone.md)
 - [RebillySdk::SignedLinkLink](docs/SignedLinkLink.md)
 - [RebillySdk::Skrill](docs/Skrill.md)
 - [RebillySdk::SkrillCredentials](docs/SkrillCredentials.md)
 - [RebillySdk::SmartInvoice](docs/SmartInvoice.md)
 - [RebillySdk::SmartInvoice3dsServer](docs/SmartInvoice3dsServer.md)
 - [RebillySdk::SmartInvoice3dsServers](docs/SmartInvoice3dsServers.md)
 - [RebillySdk::SmartInvoiceCredentials](docs/SmartInvoiceCredentials.md)
 - [RebillySdk::Sofort](docs/Sofort.md)
 - [RebillySdk::SofortCredentials](docs/SofortCredentials.md)
 - [RebillySdk::SparkPay](docs/SparkPay.md)
 - [RebillySdk::SparkPayCredentials](docs/SparkPayCredentials.md)
 - [RebillySdk::Stairstep](docs/Stairstep.md)
 - [RebillySdk::StairstepBrackets](docs/StairstepBrackets.md)
 - [RebillySdk::StaticGateway](docs/StaticGateway.md)
 - [RebillySdk::StaticIpnLink](docs/StaticIpnLink.md)
 - [RebillySdk::Stripe](docs/Stripe.md)
 - [RebillySdk::Stripe3dsServer](docs/Stripe3dsServer.md)
 - [RebillySdk::Stripe3dsServers](docs/Stripe3dsServers.md)
 - [RebillySdk::StripeCredentials](docs/StripeCredentials.md)
 - [RebillySdk::StripeSettings](docs/StripeSettings.md)
 - [RebillySdk::Subscription](docs/Subscription.md)
 - [RebillySdk::SubscriptionCancellation](docs/SubscriptionCancellation.md)
 - [RebillySdk::SubscriptionCancellationState](docs/SubscriptionCancellationState.md)
 - [RebillySdk::SubscriptionChange](docs/SubscriptionChange.md)
 - [RebillySdk::SubscriptionChangeItems](docs/SubscriptionChangeItems.md)
 - [RebillySdk::SubscriptionInvoice](docs/SubscriptionInvoice.md)
 - [RebillySdk::SubscriptionLink](docs/SubscriptionLink.md)
 - [RebillySdk::SubscriptionMetadata](docs/SubscriptionMetadata.md)
 - [RebillySdk::SubscriptionOrder](docs/SubscriptionOrder.md)
 - [RebillySdk::SubscriptionReactivation](docs/SubscriptionReactivation.md)
 - [RebillySdk::TWINT](docs/TWINT.md)
 - [RebillySdk::TWINTCredentials](docs/TWINTCredentials.md)
 - [RebillySdk::TWINTSettings](docs/TWINTSettings.md)
 - [RebillySdk::Tag](docs/Tag.md)
 - [RebillySdk::TagCustomersBody](docs/TagCustomersBody.md)
 - [RebillySdk::TagCustomersBody1](docs/TagCustomersBody1.md)
 - [RebillySdk::TagKycdocumentsBody](docs/TagKycdocumentsBody.md)
 - [RebillySdk::TagKycdocumentsBody1](docs/TagKycdocumentsBody1.md)
 - [RebillySdk::Telr](docs/Telr.md)
 - [RebillySdk::TelrCredentials](docs/TelrCredentials.md)
 - [RebillySdk::TelrSettings](docs/TelrSettings.md)
 - [RebillySdk::TestProcessor](docs/TestProcessor.md)
 - [RebillySdk::TestProcessor3dsServer](docs/TestProcessor3dsServer.md)
 - [RebillySdk::TestProcessor3dsServers](docs/TestProcessor3dsServers.md)
 - [RebillySdk::ThreeColumns](docs/ThreeColumns.md)
 - [RebillySdk::ThreeDSecureIO3dsServer](docs/ThreeDSecureIO3dsServer.md)
 - [RebillySdk::ThreeDSecureResult](docs/ThreeDSecureResult.md)
 - [RebillySdk::ThreeDSecureServerName](docs/ThreeDSecureServerName.md)
 - [RebillySdk::ThreecolumnsData](docs/ThreecolumnsData.md)
 - [RebillySdk::Tiered](docs/Tiered.md)
 - [RebillySdk::TimeIso8601Extended](docs/TimeIso8601Extended.md)
 - [RebillySdk::TimePluralUnit](docs/TimePluralUnit.md)
 - [RebillySdk::TimeUnit](docs/TimeUnit.md)
 - [RebillySdk::TimelineAction](docs/TimelineAction.md)
 - [RebillySdk::TimelineExtraData](docs/TimelineExtraData.md)
 - [RebillySdk::TimelineExtraDataAuthor](docs/TimelineExtraDataAuthor.md)
 - [RebillySdk::TimelineExtraDataLinks](docs/TimelineExtraDataLinks.md)
 - [RebillySdk::TimelineTable](docs/TimelineTable.md)
 - [RebillySdk::ToditoCash](docs/ToditoCash.md)
 - [RebillySdk::ToditoCashCredentials](docs/ToditoCashCredentials.md)
 - [RebillySdk::TotalRedemptions](docs/TotalRedemptions.md)
 - [RebillySdk::Transaction](docs/Transaction.md)
 - [RebillySdk::TransactionAllocationsLink](docs/TransactionAllocationsLink.md)
 - [RebillySdk::TransactionBumpOffer](docs/TransactionBumpOffer.md)
 - [RebillySdk::TransactionDcc](docs/TransactionDcc.md)
 - [RebillySdk::TransactionEmbed](docs/TransactionEmbed.md)
 - [RebillySdk::TransactionGateway](docs/TransactionGateway.md)
 - [RebillySdk::TransactionGatewayAvsResponse](docs/TransactionGatewayAvsResponse.md)
 - [RebillySdk::TransactionGatewayCvvResponse](docs/TransactionGatewayCvvResponse.md)
 - [RebillySdk::TransactionGatewayResponse](docs/TransactionGatewayResponse.md)
 - [RebillySdk::TransactionLink](docs/TransactionLink.md)
 - [RebillySdk::TransactionNotificationUrl](docs/TransactionNotificationUrl.md)
 - [RebillySdk::TransactionQuery](docs/TransactionQuery.md)
 - [RebillySdk::TransactionRefund](docs/TransactionRefund.md)
 - [RebillySdk::TransactionRequest](docs/TransactionRequest.md)
 - [RebillySdk::TransactionTimeline](docs/TransactionTimeline.md)
 - [RebillySdk::TransactionUpdate](docs/TransactionUpdate.md)
 - [RebillySdk::TransactionUpdateUrlLink](docs/TransactionUpdateUrlLink.md)
 - [RebillySdk::Truevo](docs/Truevo.md)
 - [RebillySdk::Truevo3dsServers](docs/Truevo3dsServers.md)
 - [RebillySdk::TruevoCredentials](docs/TruevoCredentials.md)
 - [RebillySdk::TrustPay](docs/TrustPay.md)
 - [RebillySdk::TrustPay3dsServers](docs/TrustPay3dsServers.md)
 - [RebillySdk::TrustPayCredentials](docs/TrustPayCredentials.md)
 - [RebillySdk::Trustly](docs/Trustly.md)
 - [RebillySdk::TrustlyCredentials](docs/TrustlyCredentials.md)
 - [RebillySdk::TrustsPay](docs/TrustsPay.md)
 - [RebillySdk::TrustsPayCredentials](docs/TrustsPayCredentials.md)
 - [RebillySdk::TwoColumns](docs/TwoColumns.md)
 - [RebillySdk::TwocolumnsData](docs/TwocolumnsData.md)
 - [RebillySdk::UPayCard](docs/UPayCard.md)
 - [RebillySdk::UPayCardCredentials](docs/UPayCardCredentials.md)
 - [RebillySdk::UPayCardSettings](docs/UPayCardSettings.md)
 - [RebillySdk::USAePay](docs/USAePay.md)
 - [RebillySdk::USAePayCredentials](docs/USAePayCredentials.md)
 - [RebillySdk::UpcomingInvoiceItem](docs/UpcomingInvoiceItem.md)
 - [RebillySdk::UpcomingInvoiceItemCollection](docs/UpcomingInvoiceItemCollection.md)
 - [RebillySdk::VCreditos](docs/VCreditos.md)
 - [RebillySdk::VCreditosCredentials](docs/VCreditosCredentials.md)
 - [RebillySdk::VCreditosSettings](docs/VCreditosSettings.md)
 - [RebillySdk::ValidationErrorExtensions](docs/ValidationErrorExtensions.md)
 - [RebillySdk::ValidationErrorExtensionsInvalidFields](docs/ValidationErrorExtensionsInvalidFields.md)
 - [RebillySdk::VantivLitle](docs/VantivLitle.md)
 - [RebillySdk::VantivLitle3dsServers](docs/VantivLitle3dsServers.md)
 - [RebillySdk::VantivLitleCredentials](docs/VantivLitleCredentials.md)
 - [RebillySdk::VaultedInstrument](docs/VaultedInstrument.md)
 - [RebillySdk::VegaaH](docs/VegaaH.md)
 - [RebillySdk::VegaaHCredentials](docs/VegaaHCredentials.md)
 - [RebillySdk::Volume](docs/Volume.md)
 - [RebillySdk::Wallet88](docs/Wallet88.md)
 - [RebillySdk::Wallet88Credentials](docs/Wallet88Credentials.md)
 - [RebillySdk::Walpay](docs/Walpay.md)
 - [RebillySdk::Walpay3dsServers](docs/Walpay3dsServers.md)
 - [RebillySdk::WalpayCredentials](docs/WalpayCredentials.md)
 - [RebillySdk::WebsiteEmbed](docs/WebsiteEmbed.md)
 - [RebillySdk::WebsiteLink](docs/WebsiteLink.md)
 - [RebillySdk::WesternUnion](docs/WesternUnion.md)
 - [RebillySdk::WesternUnionCredentials](docs/WesternUnionCredentials.md)
 - [RebillySdk::Wirecard](docs/Wirecard.md)
 - [RebillySdk::Wirecard3dsServer](docs/Wirecard3dsServer.md)
 - [RebillySdk::Wirecard3dsServers](docs/Wirecard3dsServers.md)
 - [RebillySdk::WirecardCredentials](docs/WirecardCredentials.md)
 - [RebillySdk::WorldlineAtosFrankfurt](docs/WorldlineAtosFrankfurt.md)
 - [RebillySdk::WorldlineAtosFrankfurt3dsServers](docs/WorldlineAtosFrankfurt3dsServers.md)
 - [RebillySdk::WorldlineAtosFrankfurtCredentials](docs/WorldlineAtosFrankfurtCredentials.md)
 - [RebillySdk::WorldlineAtosFrankfurtSettings](docs/WorldlineAtosFrankfurtSettings.md)
 - [RebillySdk::Worldpay](docs/Worldpay.md)
 - [RebillySdk::Worldpay3dsServers](docs/Worldpay3dsServers.md)
 - [RebillySdk::WorldpayCredentials](docs/WorldpayCredentials.md)
 - [RebillySdk::WorldpaySettings](docs/WorldpaySettings.md)
 - [RebillySdk::XPay](docs/XPay.md)
 - [RebillySdk::XPayCredentials](docs/XPayCredentials.md)
 - [RebillySdk::Zimpler](docs/Zimpler.md)
 - [RebillySdk::ZimplerCredentials](docs/ZimplerCredentials.md)
 - [RebillySdk::Zotapay](docs/Zotapay.md)
 - [RebillySdk::ZotapayCredentials](docs/ZotapayCredentials.md)

## Documentation for Authorization


### ApplicationJWT


### JWT


### PublishableApiKey

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

### SecretApiKey

- **Type**: API key
- **API key parameter name**: REB-APIKEY
- **Location**: HTTP header

