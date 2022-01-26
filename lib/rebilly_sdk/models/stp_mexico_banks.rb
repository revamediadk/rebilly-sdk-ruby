=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

require 'date'

module RebillySdk
  class STPMexicoBanks
    37006 = 37006.freeze
    37009 = 37009.freeze
    37019 = 37019.freeze
    37135 = 37135.freeze
    37166 = 37166.freeze
    37168 = 37168.freeze
    40002 = 40002.freeze
    40012 = 40012.freeze
    40014 = 40014.freeze
    40021 = 40021.freeze
    40030 = 40030.freeze
    40036 = 40036.freeze
    40037 = 40037.freeze
    40042 = 40042.freeze
    40044 = 40044.freeze
    40058 = 40058.freeze
    40059 = 40059.freeze
    40060 = 40060.freeze
    40062 = 40062.freeze
    40072 = 40072.freeze
    40102 = 40102.freeze
    40103 = 40103.freeze
    40106 = 40106.freeze
    40108 = 40108.freeze
    40110 = 40110.freeze
    40112 = 40112.freeze
    40113 = 40113.freeze
    40124 = 40124.freeze
    40126 = 40126.freeze
    40127 = 40127.freeze
    40128 = 40128.freeze
    40129 = 40129.freeze
    40130 = 40130.freeze
    40131 = 40131.freeze
    40132 = 40132.freeze
    40133 = 40133.freeze
    40136 = 40136.freeze
    40137 = 40137.freeze
    40138 = 40138.freeze
    40140 = 40140.freeze
    40141 = 40141.freeze
    40143 = 40143.freeze
    40145 = 40145.freeze
    40147 = 40147.freeze
    40148 = 40148.freeze
    40150 = 40150.freeze
    40151 = 40151.freeze
    40152 = 40152.freeze
    40154 = 40154.freeze
    40155 = 40155.freeze
    40156 = 40156.freeze
    40158 = 40158.freeze
    90600 = 90600.freeze
    90601 = 90601.freeze
    90602 = 90602.freeze
    90605 = 90605.freeze
    90606 = 90606.freeze
    90608 = 90608.freeze
    90613 = 90613.freeze
    90614 = 90614.freeze
    90616 = 90616.freeze
    90617 = 90617.freeze
    90620 = 90620.freeze
    90621 = 90621.freeze
    90623 = 90623.freeze
    90626 = 90626.freeze
    90627 = 90627.freeze
    90628 = 90628.freeze
    90630 = 90630.freeze
    90631 = 90631.freeze
    90634 = 90634.freeze
    90636 = 90636.freeze
    90637 = 90637.freeze
    90638 = 90638.freeze
    90640 = 90640.freeze
    90642 = 90642.freeze
    90646 = 90646.freeze
    90648 = 90648.freeze
    90649 = 90649.freeze
    90652 = 90652.freeze
    90653 = 90653.freeze
    90655 = 90655.freeze
    90656 = 90656.freeze
    90659 = 90659.freeze
    90670 = 90670.freeze
    90671 = 90671.freeze
    90674 = 90674.freeze
    90677 = 90677.freeze
    90678 = 90678.freeze
    90679 = 90679.freeze
    90680 = 90680.freeze
    90681 = 90681.freeze
    90683 = 90683.freeze
    90684 = 90684.freeze
    90685 = 90685.freeze
    90686 = 90686.freeze
    90687 = 90687.freeze
    90689 = 90689.freeze
    90901 = 90901.freeze
    90902 = 90902.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = STPMexicoBanks.constants.select { |c| STPMexicoBanks::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #STPMexicoBanks" if constantValues.empty?
      value
    end
  end
end
