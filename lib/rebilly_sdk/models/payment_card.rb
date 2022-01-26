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
  class PaymentCard
    # The payment instrument ID.
    attr_accessor :id

    # The method of payment instrument.
    attr_accessor :method

    # The customer ID.
    attr_accessor :customer_id

    # Payment instrument status. When an instrument is `active` it means it has been used at least once for an approved transaction. To remove an instrument from being in use, set it as `deactivated` (see the deactivation endpoint). 
    attr_accessor :status

    # A unique value to identify the payment instrument regardless of variable values. It contains alphanumeric values.
    attr_accessor :fingerprint

    # The card's bin (the PAN's first 6 digits).
    attr_accessor :bin

    # The PAN's last 4 digits.
    attr_accessor :last4

    # The card PAN (primary account number).
    attr_accessor :pan

    # Card's expiration year.
    attr_accessor :exp_year

    # Card's expiration month.
    attr_accessor :exp_month

    # Card's cvv (card verification value).
    attr_accessor :cvv

    attr_accessor :brand

    # Payment instrument bank country.
    attr_accessor :bank_country

    # Payment instrument bank name.
    attr_accessor :bank_name

    # The billing address.
    attr_accessor :billing_address

    # Payment instrument created time.
    attr_accessor :created_time

    # Payment instrument updated time.
    attr_accessor :updated_time

    attr_accessor :custom_fields

    attr_accessor :risk_metadata

    # Default gateway account ID used for transactions.
    attr_accessor :sticky_gateway_account_id

    # Time expiration reminder event will be triggered.
    attr_accessor :expiration_reminder_time

    # Number of expiration reminder events triggered.
    attr_accessor :expiration_reminder_number

    # Payment instrument reference data.
    attr_accessor :reference_data

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
        :'id' => :'id',
        :'method' => :'method',
        :'customer_id' => :'customerId',
        :'status' => :'status',
        :'fingerprint' => :'fingerprint',
        :'bin' => :'bin',
        :'last4' => :'last4',
        :'pan' => :'pan',
        :'exp_year' => :'expYear',
        :'exp_month' => :'expMonth',
        :'cvv' => :'cvv',
        :'brand' => :'brand',
        :'bank_country' => :'bankCountry',
        :'bank_name' => :'bankName',
        :'billing_address' => :'billingAddress',
        :'created_time' => :'createdTime',
        :'updated_time' => :'updatedTime',
        :'custom_fields' => :'customFields',
        :'risk_metadata' => :'riskMetadata',
        :'sticky_gateway_account_id' => :'stickyGatewayAccountId',
        :'expiration_reminder_time' => :'expirationReminderTime',
        :'expiration_reminder_number' => :'expirationReminderNumber',
        :'reference_data' => :'referenceData',
        :'_links' => :'_links',
        :'_embedded' => :'_embedded'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'',
        :'method' => :'',
        :'customer_id' => :'',
        :'status' => :'',
        :'fingerprint' => :'',
        :'bin' => :'',
        :'last4' => :'',
        :'pan' => :'',
        :'exp_year' => :'',
        :'exp_month' => :'',
        :'cvv' => :'',
        :'brand' => :'',
        :'bank_country' => :'',
        :'bank_name' => :'',
        :'billing_address' => :'',
        :'created_time' => :'',
        :'updated_time' => :'',
        :'custom_fields' => :'',
        :'risk_metadata' => :'',
        :'sticky_gateway_account_id' => :'',
        :'expiration_reminder_time' => :'',
        :'expiration_reminder_number' => :'',
        :'reference_data' => :'',
        :'_links' => :'',
        :'_embedded' => :''
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'expiration_reminder_time',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::PaymentCard` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::PaymentCard`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'method')
        self.method = attributes[:'method']
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'fingerprint')
        self.fingerprint = attributes[:'fingerprint']
      end

      if attributes.key?(:'bin')
        self.bin = attributes[:'bin']
      end

      if attributes.key?(:'last4')
        self.last4 = attributes[:'last4']
      end

      if attributes.key?(:'pan')
        self.pan = attributes[:'pan']
      end

      if attributes.key?(:'exp_year')
        self.exp_year = attributes[:'exp_year']
      end

      if attributes.key?(:'exp_month')
        self.exp_month = attributes[:'exp_month']
      end

      if attributes.key?(:'cvv')
        self.cvv = attributes[:'cvv']
      end

      if attributes.key?(:'brand')
        self.brand = attributes[:'brand']
      end

      if attributes.key?(:'bank_country')
        self.bank_country = attributes[:'bank_country']
      end

      if attributes.key?(:'bank_name')
        self.bank_name = attributes[:'bank_name']
      end

      if attributes.key?(:'billing_address')
        self.billing_address = attributes[:'billing_address']
      end

      if attributes.key?(:'created_time')
        self.created_time = attributes[:'created_time']
      end

      if attributes.key?(:'updated_time')
        self.updated_time = attributes[:'updated_time']
      end

      if attributes.key?(:'custom_fields')
        self.custom_fields = attributes[:'custom_fields']
      end

      if attributes.key?(:'risk_metadata')
        self.risk_metadata = attributes[:'risk_metadata']
      end

      if attributes.key?(:'sticky_gateway_account_id')
        self.sticky_gateway_account_id = attributes[:'sticky_gateway_account_id']
      end

      if attributes.key?(:'expiration_reminder_time')
        self.expiration_reminder_time = attributes[:'expiration_reminder_time']
      end

      if attributes.key?(:'expiration_reminder_number')
        self.expiration_reminder_number = attributes[:'expiration_reminder_number']
      end

      if attributes.key?(:'reference_data')
        if (value = attributes[:'reference_data']).is_a?(Hash)
          self.reference_data = value
        end
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
      method_validator = EnumAttributeValidator.new('', ['payment-card'])
      return false unless method_validator.valid?(@method)
      status_validator = EnumAttributeValidator.new('', ['active', 'inactive', 'expired', 'deactivated', 'verification-needed'])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] method Object to be assigned
    def method=(method)
      validator = EnumAttributeValidator.new('', ['payment-card'])
      unless validator.valid?(method)
        fail ArgumentError, "invalid value for \"method\", must be one of #{validator.allowable_values}."
      end
      @method = method
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('', ['active', 'inactive', 'expired', 'deactivated', 'verification-needed'])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          method == o.method &&
          customer_id == o.customer_id &&
          status == o.status &&
          fingerprint == o.fingerprint &&
          bin == o.bin &&
          last4 == o.last4 &&
          pan == o.pan &&
          exp_year == o.exp_year &&
          exp_month == o.exp_month &&
          cvv == o.cvv &&
          brand == o.brand &&
          bank_country == o.bank_country &&
          bank_name == o.bank_name &&
          billing_address == o.billing_address &&
          created_time == o.created_time &&
          updated_time == o.updated_time &&
          custom_fields == o.custom_fields &&
          risk_metadata == o.risk_metadata &&
          sticky_gateway_account_id == o.sticky_gateway_account_id &&
          expiration_reminder_time == o.expiration_reminder_time &&
          expiration_reminder_number == o.expiration_reminder_number &&
          reference_data == o.reference_data &&
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
      [id, method, customer_id, status, fingerprint, bin, last4, pan, exp_year, exp_month, cvv, brand, bank_country, bank_name, billing_address, created_time, updated_time, custom_fields, risk_metadata, sticky_gateway_account_id, expiration_reminder_time, expiration_reminder_number, reference_data, _links, _embedded].hash
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
