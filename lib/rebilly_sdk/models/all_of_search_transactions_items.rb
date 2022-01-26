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
  class AllOfSearchTransactionsItems
    # The transaction's Gateway Account ID.
    attr_accessor :gateway_account_id

    # The gateway's transaction ID.
    attr_accessor :gateway_transaction_id

    attr_accessor :gateway

    # Acquirer name, available only when transaction use gateway, else null.
    attr_accessor :acquirer_name

    # Payment Method. Use `paymentInstrument.method` instead.
    attr_accessor :method

    # The number of transactions by the same customer in the past 24 hours.
    attr_accessor :velocity

    # The number of times the transaction data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation. 
    attr_accessor :revision

    # Transaction reference data.
    attr_accessor :reference_data

    # Payment Card BIN.
    attr_accessor :bin

    attr_accessor :payment_instrument

    # True if transaction has Dynamic Currency Conversion applied.
    attr_accessor :has_dcc

    attr_accessor :dcc

    # True if transaction has a Bump offer.
    attr_accessor :has_bump_offer

    attr_accessor :bump_offer

    # The transaction's risk score.
    attr_accessor :risk_score

    # Risk metadata.
    attr_accessor :risk_metadata

    attr_accessor :notification_url

    # True if transaction is disputed.
    attr_accessor :is_disputed

    # Time the dispute was created, else null.
    attr_accessor :dispute_time

    # The dispute's status, else null.
    attr_accessor :dispute_status

    # True if the transaction has been verified with gateway batch data.
    attr_accessor :is_reconciled

    # True if the transaction was processed outside of Rebilly.
    attr_accessor :is_processed_outside

    # True if the transaction was initiated by the merchant.
    attr_accessor :is_merchant_initiated

    # True if the transaction has been updated due to a discrepancy with its. source of truth.
    attr_accessor :had_discrepancy

    # The transaction's order ID.  This ID must be unique within a 24 hour period. This field was renamed to the `requestId`.
    attr_accessor :order_id

    # The acquirer reference number.
    attr_accessor :arn

    # Transaction amount converted to organization selected report currency.
    attr_accessor :report_amount

    attr_accessor :report_currency

    # The time that the transaction was settled by the banking instuition.
    attr_accessor :settlement_time

    # The time of the most recent discrepancy on the transaction.
    attr_accessor :discrepancy_time

    # The links related to resource.
    attr_accessor :_links

    # Any embedded objects available that are requested by the `expand` querystring parameter.
    attr_accessor :_embedded

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'gateway_account_id' => :'gatewayAccountId',
        :'gateway_transaction_id' => :'gatewayTransactionId',
        :'gateway' => :'gateway',
        :'acquirer_name' => :'acquirerName',
        :'method' => :'method',
        :'velocity' => :'velocity',
        :'revision' => :'revision',
        :'reference_data' => :'referenceData',
        :'bin' => :'bin',
        :'payment_instrument' => :'paymentInstrument',
        :'has_dcc' => :'hasDcc',
        :'dcc' => :'dcc',
        :'has_bump_offer' => :'hasBumpOffer',
        :'bump_offer' => :'bumpOffer',
        :'risk_score' => :'riskScore',
        :'risk_metadata' => :'riskMetadata',
        :'notification_url' => :'notificationUrl',
        :'is_disputed' => :'isDisputed',
        :'dispute_time' => :'disputeTime',
        :'dispute_status' => :'disputeStatus',
        :'is_reconciled' => :'isReconciled',
        :'is_processed_outside' => :'isProcessedOutside',
        :'is_merchant_initiated' => :'isMerchantInitiated',
        :'had_discrepancy' => :'hadDiscrepancy',
        :'order_id' => :'orderId',
        :'arn' => :'arn',
        :'report_amount' => :'reportAmount',
        :'report_currency' => :'reportCurrency',
        :'settlement_time' => :'settlementTime',
        :'discrepancy_time' => :'discrepancyTime',
        :'_links' => :'_links',
        :'_embedded' => :'_embedded'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'gateway_account_id' => :'',
        :'gateway_transaction_id' => :'',
        :'gateway' => :'',
        :'acquirer_name' => :'',
        :'method' => :'',
        :'velocity' => :'',
        :'revision' => :'',
        :'reference_data' => :'',
        :'bin' => :'',
        :'payment_instrument' => :'',
        :'has_dcc' => :'',
        :'dcc' => :'',
        :'has_bump_offer' => :'',
        :'bump_offer' => :'',
        :'risk_score' => :'',
        :'risk_metadata' => :'',
        :'notification_url' => :'',
        :'is_disputed' => :'',
        :'dispute_time' => :'',
        :'dispute_status' => :'',
        :'is_reconciled' => :'',
        :'is_processed_outside' => :'',
        :'is_merchant_initiated' => :'',
        :'had_discrepancy' => :'',
        :'order_id' => :'',
        :'arn' => :'',
        :'report_amount' => :'',
        :'report_currency' => :'',
        :'settlement_time' => :'',
        :'discrepancy_time' => :'',
        :'_links' => :'',
        :'_embedded' => :''
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'reference_data',
        :'dispute_time',
        :'dispute_status',
        :'settlement_time',
        :'discrepancy_time',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::AllOfSearchTransactionsItems` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::AllOfSearchTransactionsItems`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'gateway_account_id')
        self.gateway_account_id = attributes[:'gateway_account_id']
      end

      if attributes.key?(:'gateway_transaction_id')
        self.gateway_transaction_id = attributes[:'gateway_transaction_id']
      end

      if attributes.key?(:'gateway')
        self.gateway = attributes[:'gateway']
      end

      if attributes.key?(:'acquirer_name')
        self.acquirer_name = attributes[:'acquirer_name']
      end

      if attributes.key?(:'method')
        self.method = attributes[:'method']
      end

      if attributes.key?(:'velocity')
        self.velocity = attributes[:'velocity']
      end

      if attributes.key?(:'revision')
        self.revision = attributes[:'revision']
      end

      if attributes.key?(:'reference_data')
        if (value = attributes[:'reference_data']).is_a?(Hash)
          self.reference_data = value
        end
      end

      if attributes.key?(:'bin')
        self.bin = attributes[:'bin']
      end

      if attributes.key?(:'payment_instrument')
        self.payment_instrument = attributes[:'payment_instrument']
      end

      if attributes.key?(:'has_dcc')
        self.has_dcc = attributes[:'has_dcc']
      end

      if attributes.key?(:'dcc')
        self.dcc = attributes[:'dcc']
      end

      if attributes.key?(:'has_bump_offer')
        self.has_bump_offer = attributes[:'has_bump_offer']
      end

      if attributes.key?(:'bump_offer')
        self.bump_offer = attributes[:'bump_offer']
      end

      if attributes.key?(:'risk_score')
        self.risk_score = attributes[:'risk_score']
      end

      if attributes.key?(:'risk_metadata')
        self.risk_metadata = attributes[:'risk_metadata']
      end

      if attributes.key?(:'notification_url')
        self.notification_url = attributes[:'notification_url']
      end

      if attributes.key?(:'is_disputed')
        self.is_disputed = attributes[:'is_disputed']
      end

      if attributes.key?(:'dispute_time')
        self.dispute_time = attributes[:'dispute_time']
      end

      if attributes.key?(:'dispute_status')
        self.dispute_status = attributes[:'dispute_status']
      end

      if attributes.key?(:'is_reconciled')
        self.is_reconciled = attributes[:'is_reconciled']
      end

      if attributes.key?(:'is_processed_outside')
        self.is_processed_outside = attributes[:'is_processed_outside']
      end

      if attributes.key?(:'is_merchant_initiated')
        self.is_merchant_initiated = attributes[:'is_merchant_initiated']
      end

      if attributes.key?(:'had_discrepancy')
        self.had_discrepancy = attributes[:'had_discrepancy']
      end

      if attributes.key?(:'order_id')
        self.order_id = attributes[:'order_id']
      end

      if attributes.key?(:'arn')
        self.arn = attributes[:'arn']
      end

      if attributes.key?(:'report_amount')
        self.report_amount = attributes[:'report_amount']
      end

      if attributes.key?(:'report_currency')
        self.report_currency = attributes[:'report_currency']
      end

      if attributes.key?(:'settlement_time')
        self.settlement_time = attributes[:'settlement_time']
      end

      if attributes.key?(:'discrepancy_time')
        self.discrepancy_time = attributes[:'discrepancy_time']
      end

      if attributes.key?(:'_links')
        if (value = attributes[:'_links']).is_a?(Array)
          self._links = value
        end
      end

      if attributes.key?(:'_embedded')
        if (value = attributes[:'_embedded']).is_a?(Array)
          self._embedded = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = super
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      dispute_status_validator = EnumAttributeValidator.new('', ['response-needed', 'under-review', 'forfeited', 'won', 'lost', 'unknown'])
      return false unless dispute_status_validator.valid?(@dispute_status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] dispute_status Object to be assigned
    def dispute_status=(dispute_status)
      validator = EnumAttributeValidator.new('', ['response-needed', 'under-review', 'forfeited', 'won', 'lost', 'unknown'])
      unless validator.valid?(dispute_status)
        fail ArgumentError, "invalid value for \"dispute_status\", must be one of #{validator.allowable_values}."
      end
      @dispute_status = dispute_status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          gateway_account_id == o.gateway_account_id &&
          gateway_transaction_id == o.gateway_transaction_id &&
          gateway == o.gateway &&
          acquirer_name == o.acquirer_name &&
          method == o.method &&
          velocity == o.velocity &&
          revision == o.revision &&
          reference_data == o.reference_data &&
          bin == o.bin &&
          payment_instrument == o.payment_instrument &&
          has_dcc == o.has_dcc &&
          dcc == o.dcc &&
          has_bump_offer == o.has_bump_offer &&
          bump_offer == o.bump_offer &&
          risk_score == o.risk_score &&
          risk_metadata == o.risk_metadata &&
          notification_url == o.notification_url &&
          is_disputed == o.is_disputed &&
          dispute_time == o.dispute_time &&
          dispute_status == o.dispute_status &&
          is_reconciled == o.is_reconciled &&
          is_processed_outside == o.is_processed_outside &&
          is_merchant_initiated == o.is_merchant_initiated &&
          had_discrepancy == o.had_discrepancy &&
          order_id == o.order_id &&
          arn == o.arn &&
          report_amount == o.report_amount &&
          report_currency == o.report_currency &&
          settlement_time == o.settlement_time &&
          discrepancy_time == o.discrepancy_time &&
          _links == o._links &&
          _embedded == o._embedded && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [gateway_account_id, gateway_transaction_id, gateway, acquirer_name, method, velocity, revision, reference_data, bin, payment_instrument, has_dcc, dcc, has_bump_offer, bump_offer, risk_score, risk_metadata, notification_url, is_disputed, dispute_time, dispute_status, is_reconciled, is_processed_outside, is_merchant_initiated, had_discrepancy, order_id, arn, report_amount, report_currency, settlement_time, discrepancy_time, _links, _embedded].hash
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
      super(attributes)
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
      hash = super
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
