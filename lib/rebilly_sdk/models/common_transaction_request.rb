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
  class CommonTransactionRequest
    # The website identifier string.
    attr_accessor :website_id

    # The customer identifier string.
    attr_accessor :customer_id

    attr_accessor :currency

    # The transaction amount.
    attr_accessor :amount

    # The array of invoice identifiers.
    attr_accessor :invoice_ids

    # Payment instruction. If not supplied, customer's default payment instrument will be used.
    attr_accessor :payment_instruction

    # Billing address. If not supplied, we use the billing address associated with the payment instrument, and then customer.
    attr_accessor :billing_address

    # The request id is **recommended**. It prevents duplicate transaction requests within a short period of time. If a duplicate request is sent with the same `requestId` it will be ignored to prevent double-billing anyone.  It must be unique within a 24-hour period.  We recommend generating a UUID v4 as its value.
    attr_accessor :request_id

    # Rebilly will select the appropriate payment gateway account for the transaction based on the properties of the transaction and the `gateway-account-requested` event rules configurations. If you wish to prevent Rebilly from making the gateway account selection, you may supply a gateway account id here, and it will be used instead. Only use this field if you intend to override the settings.
    attr_accessor :gateway_account_id

    # The payment description.
    attr_accessor :description

    # The URL where a server-to-server notification request type `POST` with a transaction payload will be sent when the transaction's result is finalized. Do not trust the notification; follow with a `GET` request to confirm the result of the transaction. Please respond with a `2xx` HTTP status code, or we will reattempt the request again. You may use `{id}` or `{result}` as placeholders in the URL and we will replace them with the transaction's id and result accordingly. 
    attr_accessor :notification_url

    # The URL to redirect the end-user when an offsite transaction is completed. Defaults to the website's configured URL. You may use `{id}` or `{result}` as placeholders in the URL and we will replace them with the transaction's id and result accordingly.
    attr_accessor :redirect_url

    attr_accessor :custom_fields

    attr_accessor :risk_metadata

    # True if transaction was processed outside Rebilly.
    attr_accessor :is_processed_outside

    # True if the transaction was initiated by the merchant.
    attr_accessor :is_merchant_initiated

    # The time the transaction was processed. Can be specified only if transaction was processed outside Rebilly.
    attr_accessor :processed_time

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'website_id' => :'websiteId',
        :'customer_id' => :'customerId',
        :'currency' => :'currency',
        :'amount' => :'amount',
        :'invoice_ids' => :'invoiceIds',
        :'payment_instruction' => :'paymentInstruction',
        :'billing_address' => :'billingAddress',
        :'request_id' => :'requestId',
        :'gateway_account_id' => :'gatewayAccountId',
        :'description' => :'description',
        :'notification_url' => :'notificationUrl',
        :'redirect_url' => :'redirectUrl',
        :'custom_fields' => :'customFields',
        :'risk_metadata' => :'riskMetadata',
        :'is_processed_outside' => :'isProcessedOutside',
        :'is_merchant_initiated' => :'isMerchantInitiated',
        :'processed_time' => :'processedTime'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'website_id' => :'Object',
        :'customer_id' => :'Object',
        :'currency' => :'Object',
        :'amount' => :'Object',
        :'invoice_ids' => :'Object',
        :'payment_instruction' => :'Object',
        :'billing_address' => :'Object',
        :'request_id' => :'Object',
        :'gateway_account_id' => :'Object',
        :'description' => :'Object',
        :'notification_url' => :'Object',
        :'redirect_url' => :'Object',
        :'custom_fields' => :'Object',
        :'risk_metadata' => :'Object',
        :'is_processed_outside' => :'Object',
        :'is_merchant_initiated' => :'Object',
        :'processed_time' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'invoice_ids',
        :'billing_address',
        :'request_id',
        :'gateway_account_id',
        :'description',
        :'notification_url',
        :'redirect_url',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::CommonTransactionRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::CommonTransactionRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'website_id')
        self.website_id = attributes[:'website_id']
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'invoice_ids')
        if (value = attributes[:'invoice_ids']).is_a?(Array)
          self.invoice_ids = value
        end
      end

      if attributes.key?(:'payment_instruction')
        self.payment_instruction = attributes[:'payment_instruction']
      end

      if attributes.key?(:'billing_address')
        self.billing_address = attributes[:'billing_address']
      end

      if attributes.key?(:'request_id')
        self.request_id = attributes[:'request_id']
      end

      if attributes.key?(:'gateway_account_id')
        self.gateway_account_id = attributes[:'gateway_account_id']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'notification_url')
        self.notification_url = attributes[:'notification_url']
      end

      if attributes.key?(:'redirect_url')
        self.redirect_url = attributes[:'redirect_url']
      end

      if attributes.key?(:'custom_fields')
        self.custom_fields = attributes[:'custom_fields']
      end

      if attributes.key?(:'risk_metadata')
        self.risk_metadata = attributes[:'risk_metadata']
      end

      if attributes.key?(:'is_processed_outside')
        self.is_processed_outside = attributes[:'is_processed_outside']
      else
        self.is_processed_outside = false
      end

      if attributes.key?(:'is_merchant_initiated')
        self.is_merchant_initiated = attributes[:'is_merchant_initiated']
      else
        self.is_merchant_initiated = false
      end

      if attributes.key?(:'processed_time')
        self.processed_time = attributes[:'processed_time']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @website_id.nil?
        invalid_properties.push('invalid value for "website_id", website_id cannot be nil.')
      end

      if @customer_id.nil?
        invalid_properties.push('invalid value for "customer_id", customer_id cannot be nil.')
      end

      if @currency.nil?
        invalid_properties.push('invalid value for "currency", currency cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @website_id.nil?
      return false if @customer_id.nil?
      return false if @currency.nil?
      return false if @amount.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          website_id == o.website_id &&
          customer_id == o.customer_id &&
          currency == o.currency &&
          amount == o.amount &&
          invoice_ids == o.invoice_ids &&
          payment_instruction == o.payment_instruction &&
          billing_address == o.billing_address &&
          request_id == o.request_id &&
          gateway_account_id == o.gateway_account_id &&
          description == o.description &&
          notification_url == o.notification_url &&
          redirect_url == o.redirect_url &&
          custom_fields == o.custom_fields &&
          risk_metadata == o.risk_metadata &&
          is_processed_outside == o.is_processed_outside &&
          is_merchant_initiated == o.is_merchant_initiated &&
          processed_time == o.processed_time
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [website_id, customer_id, currency, amount, invoice_ids, payment_instruction, billing_address, request_id, gateway_account_id, description, notification_url, redirect_url, custom_fields, risk_metadata, is_processed_outside, is_merchant_initiated, processed_time].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        elsif attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        RebillySdk.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end  end
end
