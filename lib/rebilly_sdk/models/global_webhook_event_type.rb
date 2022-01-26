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
  class GlobalWebhookEventType
    AML_LIST_POSSIBLY_MATCHED = 'aml-list-possibly-matched'.freeze
    APPLICATION_INSTANCE_DISABLED = 'application-instance-disabled'.freeze
    APPLICATION_INSTANCE_ENABLED = 'application-instance-enabled'.freeze
    CUSTOMER_CREATED = 'customer-created'.freeze
    CUSTOMER_MERGED = 'customer-merged'.freeze
    CUSTOMER_ONE_TIME_PASSWORD_REQUESTED = 'customer-one-time-password-requested'.freeze
    CUSTOMER_REDIRECTED_OFFSITE = 'customer-redirected-offsite'.freeze
    CUSTOMER_RETURNED = 'customer-returned'.freeze
    CUSTOMER_UPDATED = 'customer-updated'.freeze
    DISPUTE_CREATED = 'dispute-created'.freeze
    DISPUTE_MODIFIED = 'dispute-modified'.freeze
    EXPERIAN_CHECK_PERFORMED = 'experian-check-performed'.freeze
    GATEWAY_ACCOUNT_DOWNTIME_ENDED = 'gateway-account-downtime-ended'.freeze
    GATEWAY_ACCOUNT_DOWNTIME_STARTED = 'gateway-account-downtime-started'.freeze
    GATEWAY_ACCOUNT_LIMIT_REACHED = 'gateway-account-limit-reached'.freeze
    GATEWAY_ACCOUNT_ONBOARDING_COMPLETED = 'gateway-account-onboarding-completed'.freeze
    GATEWAY_ACCOUNT_ONBOARDING_FAILED = 'gateway-account-onboarding-failed'.freeze
    GATEWAY_ACCOUNT_REQUESTED = 'gateway-account-requested'.freeze
    INVOICE_ABANDONED = 'invoice-abandoned'.freeze
    INVOICE_CREATED = 'invoice-created'.freeze
    INVOICE_ISSUED = 'invoice-issued'.freeze
    INVOICE_MODIFIED = 'invoice-modified'.freeze
    INVOICE_PAID = 'invoice-paid'.freeze
    INVOICE_PARTIALLY_PAID = 'invoice-partially-paid'.freeze
    INVOICE_REFUNDED = 'invoice-refunded'.freeze
    INVOICE_PARTIALLY_REFUNDED = 'invoice-partially-refunded'.freeze
    INVOICE_PAST_DUE = 'invoice-past-due'.freeze
    INVOICE_PAST_DUE_REMINDER = 'invoice-past-due-reminder'.freeze
    INVOICE_REISSUED = 'invoice-reissued'.freeze
    INVOICE_TAX_CALCULATION_FAILED = 'invoice-tax-calculation-failed'.freeze
    INVOICE_VOIDED = 'invoice-voided'.freeze
    KYC_DOCUMENT_ACCEPTED = 'kyc-document-accepted'.freeze
    KYC_DOCUMENT_CREATED = 'kyc-document-created'.freeze
    KYC_DOCUMENT_MODIFIED = 'kyc-document-modified'.freeze
    KYC_DOCUMENT_REJECTED = 'kyc-document-rejected'.freeze
    KYC_DOCUMENT_REVIEWED = 'kyc-document-reviewed'.freeze
    LEAD_SOURCE_CHANGED = 'lead-source-changed'.freeze
    NSF_RESPONSE_RECEIVED = 'nsf-response-received'.freeze
    OFFSITE_PAYMENT_COMPLETED = 'offsite-payment-completed'.freeze
    ORDER_COMPLETED = 'order-completed'.freeze
    PAYMENT_CARD_CREATED = 'payment-card-created'.freeze
    PAYMENT_CARD_EXPIRATION_REMINDER = 'payment-card-expiration-reminder'.freeze
    PAYMENT_CARD_EXPIRED = 'payment-card-expired'.freeze
    PAYMENT_INSTRUMENT_MODIFIED = 'payment-instrument-modified'.freeze
    RENEWAL_INVOICE_ISSUED = 'renewal-invoice-issued'.freeze
    RENEWAL_INVOICE_PAYMENT_CANCELED = 'renewal-invoice-payment-canceled'.freeze
    RENEWAL_INVOICE_PAYMENT_DECLINED = 'renewal-invoice-payment-declined'.freeze
    RISK_SCORE_CHANGED = 'risk-score-changed'.freeze
    SUBSCRIPTION_ACTIVATED = 'subscription-activated'.freeze
    SUBSCRIPTION_CANCELED = 'subscription-canceled'.freeze
    SUBSCRIPTION_DOWNGRADED = 'subscription-downgraded'.freeze
    SUBSCRIPTION_MODIFIED = 'subscription-modified'.freeze
    SUBSCRIPTION_REACTIVATED = 'subscription-reactivated'.freeze
    SUBSCRIPTION_RENEWAL_REMINDER = 'subscription-renewal-reminder'.freeze
    SUBSCRIPTION_RENEWED = 'subscription-renewed'.freeze
    SUBSCRIPTION_TRIAL_CONVERTED = 'subscription-trial-converted'.freeze
    SUBSCRIPTION_TRIAL_END_REMINDER = 'subscription-trial-end-reminder'.freeze
    SUBSCRIPTION_TRIAL_ENDED = 'subscription-trial-ended'.freeze
    SUBSCRIPTION_TRIAL_END_CHANGED = 'subscription-trial-end-changed'.freeze
    SUBSCRIPTION_UPGRADED = 'subscription-upgraded'.freeze
    TRANSACTION_AMOUNT_DISCREPANCY_FOUND = 'transaction-amount-discrepancy-found'.freeze
    TRANSACTION_DECLINED = 'transaction-declined'.freeze
    TRANSACTION_DISCREPANCY_FOUND = 'transaction-discrepancy-found'.freeze
    TRANSACTION_PROCESS_REQUESTED = 'transaction-process-requested'.freeze
    TRANSACTION_PROCESSED = 'transaction-processed'.freeze
    TRANSACTION_RECONCILED = 'transaction-reconciled'.freeze
    TRANSACTION_TIMEOUT_RESOLVED = 'transaction-timeout-resolved'.freeze
    WAITING_GATEWAY_TRANSACTION_COMPLETED = 'waiting-gateway-transaction-completed'.freeze
    APPLICATION_INSTANCE_ENABLED = 'application-instance-enabled'.freeze
    APPLICATION_INSTANCE_DISABLED = 'application-instance-disabled'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = GlobalWebhookEventType.constants.select { |c| GlobalWebhookEventType::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #GlobalWebhookEventType" if constantValues.empty?
      value
    end
  end
end
