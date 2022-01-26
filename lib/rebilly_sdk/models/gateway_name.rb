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
  class GatewayName
    A1_GATEWAY = 'A1Gateway'.freeze
    ADYEN = 'Adyen'.freeze
    AIRPAY = 'Airpay'.freeze
    AMAZON_PAY = 'AmazonPay'.freeze
    AMEX_VPC = 'AmexVPC'.freeze
    APCO_PAY = 'ApcoPay'.freeze
    ASIA_PAYMENT_GATEWAY = 'AsiaPaymentGateway'.freeze
    ASTRO_PAY_CARD = 'AstroPayCard'.freeze
    AUTHORIZE_NET = 'AuthorizeNet'.freeze
    AWEPAY = 'Awepay'.freeze
    BAMBORA = 'Bambora'.freeze
    BIT_PAY = 'BitPay'.freeze
    BLUE_SNAP = 'BlueSnap'.freeze
    BRAINTREE_PAYMENTS = 'BraintreePayments'.freeze
    CARDKNOX = 'Cardknox'.freeze
    CASHFLOWS = 'Cashflows'.freeze
    CAS_HLIB = 'CASHlib'.freeze
    CASH_TO_CODE = 'CashToCode'.freeze
    CAURI_PAYMENT = 'CauriPayment'.freeze
    CAYAN = 'Cayan'.freeze
    CC_AVENUE = 'CCAvenue'.freeze
    CHASE = 'Chase'.freeze
    CHECKOUT_COM = 'CheckoutCom'.freeze
    CIRCLE = 'Circle'.freeze
    CITADEL = 'Citadel'.freeze
    CLEARHAUS = 'Clearhaus'.freeze
    COD_VOUCHER = 'CODVoucher'.freeze
    COIN_GATE = 'CoinGate'.freeze
    COIN_PAYMENTS = 'CoinPayments'.freeze
    CONEKTA = 'Conekta'.freeze
    COPPR = 'Coppr'.freeze
    CREDORAX = 'Credorax'.freeze
    CRYPTONATOR = 'Cryptonator'.freeze
    CYBER_SOURCE = 'CyberSource'.freeze
    DATA_CASH = 'DataCash'.freeze
    DENGI = 'Dengi'.freeze
    DRAGONPHOENIX = 'Dragonphoenix'.freeze
    DIMOCO = 'Dimoco'.freeze
    DIRECTA24 = 'Directa24'.freeze
    D_LOCAL = 'dLocal'.freeze
    EBANX = 'EBANX'.freeze
    ECO_PAYZ = 'ecoPayz'.freeze
    ECORE_PAY = 'EcorePay'.freeze
    ELAVON = 'Elavon'.freeze
    EUTELLER = 'Euteller'.freeze
    E_MERCHANT_PAY = 'eMerchantPay'.freeze
    EMS = 'EMS'.freeze
    EPG = 'EPG'.freeze
    E_PRO = 'EPro'.freeze
    E_ZEE_WALLET = 'eZeeWallet'.freeze
    EZY_EFT = 'ezyEFT'.freeze
    FINRAX = 'Finrax'.freeze
    FLEXEPIN = 'Flexepin'.freeze
    FIN_TEC_SYSTEMS = 'FinTecSystems'.freeze
    FUND_SEND = 'FundSend'.freeze
    FORTE = 'Forte'.freeze
    GET = 'GET'.freeze
    GIGADAT = 'Gigadat'.freeze
    GLOBAL_ONE_PAY = 'GlobalOnePay'.freeze
    GOONEY = 'Gooney'.freeze
    GPAYSAFE = 'Gpaysafe'.freeze
    GREENBOX = 'Greenbox'.freeze
    HI_PAY = 'HiPay'.freeze
    I_CAN_PAY = 'iCanPay'.freeze
    ICEPAY = 'ICEPAY'.freeze
    I_CHEQUE = 'iCheque'.freeze
    I_DEBIT = 'iDebit'.freeze
    ILIXIUM = 'Ilixium'.freeze
    INGENICO = 'Ingenico'.freeze
    INOVAPAY = 'INOVAPAY'.freeze
    INOVIO = 'Inovio'.freeze
    INTUIT = 'Intuit'.freeze
    INSTA_DEBIT = 'InstaDebit'.freeze
    IPAY_OPTIONS = 'IpayOptions'.freeze
    JET_PAY = 'JetPay'.freeze
    JETON = 'Jeton'.freeze
    KHELOCARD = 'Khelocard'.freeze
    KONNEKTIVE = 'Konnektive'.freeze
    LOONIE = 'loonie'.freeze
    LPG = 'LPG'.freeze
    MAXI_CASH = 'MaxiCash'.freeze
    MI_FINITY = 'MiFinity'.freeze
    MONERIS = 'Moneris'.freeze
    MTA_PAY = 'MtaPay'.freeze
    MUCH_BETTER = 'MuchBetter'.freeze
    MY_FATOORAH = 'MyFatoorah'.freeze
    NEOSURF = 'Neosurf'.freeze
    NETBANKING = 'Netbanking'.freeze
    NETELLER = 'Neteller'.freeze
    N_GENIUS = 'NGenius'.freeze
    NINJA_WALLET = 'NinjaWallet'.freeze
    NMI = 'NMI'.freeze
    NUA_PAY = 'NuaPay'.freeze
    OCHA_PAY = 'OchaPay'.freeze
    ONLINEUEBERWEISEN = 'Onlineueberweisen'.freeze
    ON_RAMP = 'OnRamp'.freeze
    PAGSMILE = 'Pagsmile'.freeze
    PANAMERICAN = 'Panamerican'.freeze
    PARAMOUNT_EFT = 'ParamountEft'.freeze
    PARAMOUNT_INTERAC = 'ParamountInterac'.freeze
    PANDA_GATEWAY = 'PandaGateway'.freeze
    PAY4_FUN = 'Pay4Fun'.freeze
    PAY_CASH = 'PayCash'.freeze
    PAY_CLUB = 'PayClub'.freeze
    PAYEEZY = 'Payeezy'.freeze
    PAYFLOW = 'Payflow'.freeze
    PAYNOTE = 'Paynote'.freeze
    PAYMENT_ASIA = 'PaymentAsia'.freeze
    PAYMEN_TECHNOLOGIES = 'PaymenTechnologies'.freeze
    PAYMENTS_OS = 'PaymentsOS'.freeze
    PAYMERO = 'Paymero'.freeze
    PAY_PAL = 'PayPal'.freeze
    PAYR = 'Payr'.freeze
    PAYSAFE = 'Paysafe'.freeze
    PAYSAFECARD = 'Paysafecard'.freeze
    PAYSAFECASH = 'Paysafecash'.freeze
    PAY_TABS = 'PayTabs'.freeze
    PAY_U_LATAM = 'PayULatam'.freeze
    PAYVISION = 'Payvision'.freeze
    PIASTRIX = 'Piastrix'.freeze
    PLUGNPAY = 'Plugnpay'.freeze
    POST_FINANCE = 'PostFinance'.freeze
    PPRO = 'PPRO'.freeze
    PROSA = 'Prosa'.freeze
    RAPYD = 'Rapyd'.freeze
    REALEX = 'Realex'.freeze
    REALTIME = 'Realtime'.freeze
    REDSYS = 'Redsys'.freeze
    ROTESSA = 'Rotessa'.freeze
    RPN = 'RPN'.freeze
    SAFECHARGE = 'Safecharge'.freeze
    SALTAR_PAY = 'SaltarPay'.freeze
    SAGEPAY = 'Sagepay'.freeze
    SEAMLESS_CHEX = 'SeamlessChex'.freeze
    SECURE_TRADING = 'SecureTrading'.freeze
    SECURION_PAY = 'SecurionPay'.freeze
    SKRILL = 'Skrill'.freeze
    SMART_INVOICE = 'SmartInvoice'.freeze
    SMS_VOUCHER = 'SMSVoucher'.freeze
    SOFORT = 'Sofort'.freeze
    SPARK_PAY = 'SparkPay'.freeze
    STATIC_GATEWAY = 'StaticGateway'.freeze
    STP_MEXICO = 'STPMexico'.freeze
    STRIPE = 'Stripe'.freeze
    TELR = 'Telr'.freeze
    TEST_PROCESSOR = 'TestProcessor'.freeze
    TODITO_CASH = 'ToditoCash'.freeze
    TRUEVO = 'Truevo'.freeze
    TRUST_PAY = 'TrustPay'.freeze
    TRUSTS_PAY = 'TrustsPay'.freeze
    TRUSTLY = 'Trustly'.freeze
    TWINT = 'TWINT'.freeze
    U_PAY_CARD = 'UPayCard'.freeze
    US_AE_PAY = 'USAePay'.freeze
    VANTIV_LITLE = 'VantivLitle'.freeze
    VEGAA_H = 'vegaaH'.freeze
    V_CREDITOS = 'VCreditos'.freeze
    WALLET88 = 'Wallet88'.freeze
    WALPAY = 'Walpay'.freeze
    WESTERN_UNION = 'WesternUnion'.freeze
    WIRECARD = 'Wirecard'.freeze
    WORLDLINE_ATOS_FRANKFURT = 'WorldlineAtosFrankfurt'.freeze
    WORLDPAY = 'Worldpay'.freeze
    X_PAY = 'XPay'.freeze
    ZIMPLER = 'Zimpler'.freeze
    ZOTAPAY = 'Zotapay'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = GatewayName.constants.select { |c| GatewayName::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #GatewayName" if constantValues.empty?
      value
    end
  end
end
