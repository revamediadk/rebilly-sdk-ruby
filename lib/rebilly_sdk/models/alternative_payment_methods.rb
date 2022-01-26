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
  class AlternativePaymentMethods
    CASH = 'cash'.freeze
    CHECK = 'check'.freeze
    PAYPAL = 'paypal'.freeze
    ADV_CASH = 'AdvCash'.freeze
    ALFA_CLICK = 'Alfa-click'.freeze
    ALIPAY = 'Alipay'.freeze
    ASTRO_PAY_CARD = 'AstroPay Card'.freeze
    ASTRO_PAY_GO = 'AstroPay-GO'.freeze
    BANK_REFERENCED = 'BankReferenced'.freeze
    BANK_TRANSFER = 'bank-transfer'.freeze
    BANK_TRANSFER_2 = 'bank-transfer-2'.freeze
    BANK_TRANSFER_3 = 'bank-transfer-3'.freeze
    BANK_TRANSFER_4 = 'bank-transfer-4'.freeze
    BANK_TRANSFER_5 = 'bank-transfer-5'.freeze
    BANK_TRANSFER_6 = 'bank-transfer-6'.freeze
    BANK_TRANSFER_7 = 'bank-transfer-7'.freeze
    BANK_TRANSFER_8 = 'bank-transfer-8'.freeze
    BANK_TRANSFER_9 = 'bank-transfer-9'.freeze
    BALOTO = 'Baloto'.freeze
    BEELINE = 'Beeline'.freeze
    BELFIUS_DIRECT_NET = 'Belfius-direct-net'.freeze
    BITCOIN = 'bitcoin'.freeze
    BOLETO = 'Boleto'.freeze
    CASH_DEPOSIT = 'cash-deposit'.freeze
    CAS_HLIB = 'CASHlib'.freeze
    CASH_TO_CODE = 'CashToCode'.freeze
    CHINA_UNION_PAY = 'China UnionPay'.freeze
    COD_VOUCHER = 'CODVoucher'.freeze
    CONEKTA_OXXO = 'Conekta-oxxo'.freeze
    CUPON_DE_PAGOS = 'Cupon-de-pagos'.freeze
    CRYPTOCURRENCY = 'cryptocurrency'.freeze
    DOMESTIC_CARDS = 'domestic-cards'.freeze
    ECHECK = 'echeck'.freeze
    ECO_PAYZ = 'ecoPayz'.freeze
    ECO_VOUCHER = 'ecoVoucher'.freeze
    EFECTY = 'Efecty'.freeze
    EPS = 'EPS'.freeze
    E_PAYBG = 'ePay.bg'.freeze
    E_ZEE_WALLET = 'eZeeWallet'.freeze
    FLEXEPIN = 'Flexepin'.freeze
    GIROPAY = 'Giropay'.freeze
    GPAYSAFE = 'Gpaysafe'.freeze
    GOOGLE_PAY = 'Google Pay'.freeze
    I_DEBIT = 'iDebit'.freeze
    I_DEAL = 'iDEAL'.freeze
    ING_HOMEPAY = 'ING-homepay'.freeze
    INOVAPAY_PIN = 'INOVAPAY-pin'.freeze
    INOVAPAY_WALLET = 'INOVAPAY-wallet'.freeze
    INSTA_DEBIT = 'InstaDebit'.freeze
    INSTANT_BANK_TRANSFER = 'instant-bank-transfer'.freeze
    INTERAC = 'Interac'.freeze
    INTERAC_ONLINE = 'Interac-online'.freeze
    INTERAC_E_TRANSFER = 'Interac-eTransfer'.freeze
    INVOICE = 'invoice'.freeze
    I_WALLET = 'iWallet'.freeze
    JETON = 'Jeton'.freeze
    JPAY = 'jpay'.freeze
    KHELOCARD = 'Khelocard'.freeze
    KLARNA = 'Klarna'.freeze
    KNOT = 'KNOT'.freeze
    LOONIE = 'loonie'.freeze
    MATRIX = 'Matrix'.freeze
    MAXI_CASH = 'MaxiCash'.freeze
    MEGAFON = 'Megafon'.freeze
    MI_FINITY_E_WALLET = 'MiFinity-eWallet'.freeze
    MISCELLANEOUS = 'miscellaneous'.freeze
    BANCONTACT = 'Bancontact'.freeze
    BANCONTACT_MOBILE = 'Bancontact-mobile'.freeze
    MTS = 'MTS'.freeze
    MUCH_BETTER = 'MuchBetter'.freeze
    MULTIBANCO = 'Multibanco'.freeze
    NEOSURF = 'Neosurf'.freeze
    NETBANKING = 'Netbanking'.freeze
    NETELLER = 'Neteller'.freeze
    NORDEA_SOLO = 'Nordea-Solo'.freeze
    OCHA_PAY = 'OchaPay'.freeze
    ONLINE_BANK_TRANSFER = 'online-bank-transfer'.freeze
    ONLINEUEBERWEISEN = 'Onlineueberweisen'.freeze
    ORIENTAL_WALLET = 'oriental-wallet'.freeze
    OXXO = 'OXXO'.freeze
    PAGO_EFFECTIVO = 'PagoEffectivo'.freeze
    PAGSMILE_DEPOSIT_EXPRESS = 'Pagsmile-deposit-express'.freeze
    PAGSMILE_LOTTERY = 'Pagsmile-lottery'.freeze
    PAY_CASH = 'PayCash'.freeze
    PAYEER = 'Payeer'.freeze
    PAYMENT_ASIA_CRYPTO = 'PaymentAsia-crypto'.freeze
    PAYMERO = 'Paymero'.freeze
    PERFECT_MONEY = 'Perfect-money'.freeze
    PIASTRIX = 'Piastrix'.freeze
    PLAID_ACCOUNT = 'plaid-account'.freeze
    PAY_TABS = 'PayTabs'.freeze
    PAYSAFECARD = 'Paysafecard'.freeze
    PAYSAFECASH = 'Paysafecash'.freeze
    PAY4_FUN = 'Pay4Fun'.freeze
    PAYNOTE = 'Paynote'.freeze
    PIN_PAY = 'PinPay'.freeze
    PHONE = 'phone'.freeze
    PHONE_PE = 'PhonePe'.freeze
    PO_LI = 'POLi'.freeze
    POST_FINANCE_CARD = 'PostFinance-card'.freeze
    POST_FINANCE_E_FINANCE = 'PostFinance-e-finance'.freeze
    PRZELEWY24 = 'Przelewy24'.freeze
    QIWI = 'QIWI'.freeze
    Q_PAY = 'QPay'.freeze
    QQ_PAY = 'QQPay'.freeze
    RAPYD_CHECKOUT = 'rapyd-checkout'.freeze
    RESURS = 'Resurs'.freeze
    SEPA = 'SEPA'.freeze
    SKRILL = 'Skrill'.freeze
    SKRILL_RAPID_TRANSFER = 'Skrill Rapid Transfer'.freeze
    SMS_VOUCHER = 'SMSVoucher'.freeze
    SOFORT = 'Sofort'.freeze
    SPARK_PAY = 'SparkPay'.freeze
    SWIFT_DBT = 'swift-dbt'.freeze
    TELE2 = 'Tele2'.freeze
    TERMINALY_RF = 'Terminaly-RF'.freeze
    TODITO_CASH_CARD = 'ToditoCash-card'.freeze
    TRUSTLY = 'Trustly'.freeze
    U_PAY_CARD = 'UPayCard'.freeze
    UPI = 'UPI'.freeze
    USD_COIN = 'USD-coin'.freeze
    V_CREDITOS = 'VCreditos'.freeze
    VENUS_POINT = 'VenusPoint'.freeze
    VOUCHER = 'voucher'.freeze
    VOUCHER_2 = 'voucher-2'.freeze
    VOUCHER_3 = 'voucher-3'.freeze
    VOUCHER_4 = 'voucher-4'.freeze
    WEBMONEY = 'Webmoney'.freeze
    WEBPAY = 'Webpay'.freeze
    WEBPAY_2 = 'Webpay-2'.freeze
    WEBPAY_CARD = 'Webpay Card'.freeze
    WE_CHAT_PAY = 'WeChat Pay'.freeze
    X_PAY_P2_P = 'XPay-P2P'.freeze
    X_PAY_QR = 'XPay-QR'.freeze
    YANDEX_MONEY = 'Yandex-money'.freeze
    ZOTAPAY = 'Zotapay'.freeze
    ZIMPLER = 'Zimpler'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = AlternativePaymentMethods.constants.select { |c| AlternativePaymentMethods::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #AlternativePaymentMethods" if constantValues.empty?
      value
    end
  end
end
