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
  class AcquirerName
    ADYEN = 'Adyen'.freeze
    ALIPAY = 'Alipay'.freeze
    AIB = 'AIB'.freeze
    AIRPAY = 'Airpay'.freeze
    AMAZON_PAY = 'AmazonPay'.freeze
    APCO_PAY = 'ApcoPay'.freeze
    ASIA_PAYMENT_GATEWAY = 'AsiaPaymentGateway'.freeze
    ASTRO_PAY_CARD = 'AstroPay Card'.freeze
    AWEPAY = 'Awepay'.freeze
    IPAY_OPTIONS = 'Ipay Options'.freeze
    BS = 'B+S'.freeze
    BAMBORA = 'Bambora'.freeze
    BIT_PAY = 'BitPay'.freeze
    BANK_OF_AMERICA = 'Bank of America'.freeze
    BANK_OF_MOSCOW = 'Bank of Moscow'.freeze
    BANK_OF_REBILLY = 'Bank of Rebilly'.freeze
    BANK_ONE = 'Bank One'.freeze
    BMO_HARRIS_BANK = 'BMO Harris Bank'.freeze
    BORGUN = 'Borgun'.freeze
    BRAINTREE_PAYMENTS = 'BraintreePayments'.freeze
    CARDKNOX = 'Cardknox'.freeze
    CAS_HLIB = 'CASHlib'.freeze
    CASH_TO_CODE = 'CashToCode'.freeze
    CATALUNYA_CAIXA = 'Catalunya Caixa'.freeze
    CC_AVENUE = 'CCAvenue'.freeze
    CHASE = 'Chase'.freeze
    CHECKOUT_COM = 'CheckoutCom'.freeze
    CHINA_UNION_PAY = 'ChinaUnionPay'.freeze
    CIM = 'CIM'.freeze
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
    DIMOCO = 'Dimoco'.freeze
    D_LOCAL = 'dLocal'.freeze
    DRAGONPHOENIX = 'Dragonphoenix'.freeze
    EBANX = 'EBANX'.freeze
    ECO_PAYZ = 'ecoPayz'.freeze
    ECORE_PAY = 'EcorePay'.freeze
    ELAVON = 'Elavon'.freeze
    EMS = 'EMS'.freeze
    EPG = 'EPG'.freeze
    EUTELLER = 'Euteller'.freeze
    E_ZEE_WALLET = 'eZeeWallet'.freeze
    EZY_EFT = 'ezyEFT'.freeze
    FIFTH_THIRD_BANK = 'Fifth Third Bank'.freeze
    FINRAX = 'Finrax'.freeze
    FIRST_DATA_BUYPASS = 'First Data Buypass'.freeze
    FIRST_DATA_NASHVILLE = 'First Data Nashville'.freeze
    FIRST_DATA_NORTH = 'First Data North'.freeze
    FIRST_DATA_OMAHA = 'First Data Omaha'.freeze
    FIN_TEC_SYSTEMS = 'FinTecSystems'.freeze
    FLEXEPIN = 'Flexepin'.freeze
    FORTE = 'Forte'.freeze
    FUND_SEND = 'FundSend'.freeze
    GIGADAT = 'Gigadat'.freeze
    GLOBAL_EAST = 'Global East'.freeze
    GOONEY = 'Gooney'.freeze
    GPAYSAFE = 'Gpaysafe'.freeze
    HEARTLAND = 'Heartland'.freeze
    HI_PAY = 'HiPay'.freeze
    HSBC = 'HSBC'.freeze
    I_CAN_PAY = 'iCanPay'.freeze
    ICEPAY = 'ICEPAY'.freeze
    I_CHEQUE = 'iCheque'.freeze
    ILIXIUM = 'Ilixium'.freeze
    INGENICO = 'Ingenico'.freeze
    INOVAPAY = 'INOVAPAY'.freeze
    INTUIT = 'Intuit'.freeze
    JETON = 'Jeton'.freeze
    KHELOCARD = 'Khelocard'.freeze
    KONNEKTIVE = 'Konnektive'.freeze
    LOONIE = 'loonie'.freeze
    LPG = 'LPG'.freeze
    MASAPAY = 'Masapay'.freeze
    MAXI_CASH = 'MaxiCash'.freeze
    MERRICK = 'Merrick'.freeze
    MISSION_VALLEY_BANK = 'Mission Valley Bank'.freeze
    MI_FINITY = 'MiFinity'.freeze
    MONERIS = 'Moneris'.freeze
    MUCH_BETTER = 'MuchBetter'.freeze
    MY_FATOORAH = 'MyFatoorah'.freeze
    NATWEST = 'NATWEST'.freeze
    NEOSURF = 'Neosurf'.freeze
    NETBANKING = 'Netbanking'.freeze
    NETELLER = 'Neteller'.freeze
    NINJA_WALLET = 'NinjaWallet'.freeze
    NMI = 'NMI'.freeze
    NUA_PAY = 'NuaPay'.freeze
    NUVEI = 'Nuvei'.freeze
    OCHA_PAY = 'OchaPay'.freeze
    ONLINEUEBERWEISEN = 'Onlineueberweisen'.freeze
    ON_RAMP = 'OnRamp'.freeze
    OTHER = 'Other'.freeze
    PANAMERICAN = 'Panamerican'.freeze
    PANDA_BANK = 'Panda Bank'.freeze
    PARAMOUNT = 'Paramount'.freeze
    PARAMOUNT_EFT = 'ParamountEft'.freeze
    PARAMOUNT_INTERAC = 'ParamountInterac'.freeze
    PAY4FUN = 'Pay4fun'.freeze
    PAY_CASH = 'PayCash'.freeze
    PAY_CLUB = 'PayClub'.freeze
    PAYMENT_ASIA = 'PaymentAsia'.freeze
    PAYMEN_TECHNOLOGIES = 'PaymenTechnologies'.freeze
    PAYMENTS_OS = 'PaymentsOS'.freeze
    PAYMERO = 'Paymero'.freeze
    PAYNETICS = 'Paynetics'.freeze
    PAY_PAL = 'PayPal'.freeze
    PAYR = 'Payr'.freeze
    PAY_TABS = 'PayTabs'.freeze
    PAY_U_LATAM = 'PayULatam'.freeze
    PAYVISION = 'Payvision'.freeze
    PIASTRIX = 'Piastrix'.freeze
    PEOPLES_TRUST_COMPANY = 'Peoples Trust Company'.freeze
    POST_FINANCE = 'PostFinance'.freeze
    PPRO = 'PPRO'.freeze
    PRIVATBANK = 'Privatbank'.freeze
    PROSA = 'Prosa'.freeze
    QQ_PAY = 'QQPay'.freeze
    RAPYD = 'Rapyd'.freeze
    RBC = 'RBC'.freeze
    RBS_WORLD_PAY = 'RBS WorldPay'.freeze
    REAL_TIME = 'RealTime'.freeze
    ROTESSA = 'Rotessa'.freeze
    SAFECHARGE = 'Safecharge'.freeze
    SALTAR_PAY = 'SaltarPay'.freeze
    SECURE_TRADING = 'SecureTrading'.freeze
    SECURION_PAY = 'SecurionPay'.freeze
    SKRILL = 'Skrill'.freeze
    SMART_INVOICE = 'SmartInvoice'.freeze
    SMS_VOUCHER = 'SMSVoucher'.freeze
    SOFORT = 'Sofort'.freeze
    SPARK_PAY = 'SparkPay'.freeze
    STATE_BANK_OF_MAURITIUS = 'State Bank of Mauritius'.freeze
    STP_MEXICO = 'STPMexico'.freeze
    STRIPE = 'Stripe'.freeze
    TBI = 'TBI'.freeze
    TELR = 'Telr'.freeze
    TEST_PROCESSOR = 'TestProcessor'.freeze
    TODITO_CASH = 'ToditoCash'.freeze
    TRUEVO = 'Truevo'.freeze
    TRUSTLY = 'Trustly'.freeze
    TRUST_PAY = 'TrustPay'.freeze
    TRUSTS_PAY = 'TrustsPay'.freeze
    TSYS = 'TSYS'.freeze
    TWINT = 'TWINT'.freeze
    U_PAY_CARD = 'UPayCard'.freeze
    VANTIV = 'Vantiv'.freeze
    V_CREDITOS = 'VCreditos'.freeze
    VOICE_PAY = 'VoicePay'.freeze
    WALLET88 = 'Wallet88'.freeze
    WE_CHAT_PAY = 'WeChat Pay'.freeze
    WELLS_FARGO = 'Wells Fargo'.freeze
    WING_HANG_BANK = 'Wing Hang Bank'.freeze
    WIRECARD = 'Wirecard'.freeze
    WORLD_PAY = 'WorldPay'.freeze
    X_PAY = 'XPay'.freeze
    ZIMPLER = 'Zimpler'.freeze
    ZOTAPAY = 'Zotapay'.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = AcquirerName.constants.select { |c| AcquirerName::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #AcquirerName" if constantValues.empty?
      value
    end
  end
end
