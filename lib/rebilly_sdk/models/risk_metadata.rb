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
  # Risk metadata used for 3DS and risk scoring.
  class RiskMetadata
    # The customer's IP.
    attr_accessor :ip_address

    # The fingerprint.
    attr_accessor :fingerprint

    attr_accessor :http_headers

    attr_accessor :browser_data

    attr_accessor :extra_data

    # True if customer's ip address is related to proxy.
    attr_accessor :is_proxy

    # True if customer's ip address is related to VPN.
    attr_accessor :is_vpn

    # True if customer's ip address is related to TOR.
    attr_accessor :is_tor

    # True if customer's ip address is related to hosting.
    attr_accessor :is_hosting

    # VPN service name, if available.
    attr_accessor :vpn_service_name

    # Internet Service Provider name, if available.
    attr_accessor :isp

    # Country ISO Alpha-2 code for specified ipAddress.
    attr_accessor :country

    # Region for specified ipAddress.
    attr_accessor :region

    # City for specified ipAddress.
    attr_accessor :city

    # Latitude for specified ipAddress.
    attr_accessor :latitude

    # Longitude for specified ipAddress.
    attr_accessor :longitude

    # Postal code for specified ipAddress.
    attr_accessor :postal_code

    # Time zone for specified ipAddress.
    attr_accessor :time_zone

    # Accuracy radius for specified ipAddress (kilometers).
    attr_accessor :accuracy_radius

    # Distance between IP Address and Billing Address geolocation (kilometers).
    attr_accessor :distance

    # True if the billing address country and geo-IP address are not the same.
    attr_accessor :has_mismatched_billing_address_country

    # True if the bank country and geo-IP address are not the same.
    attr_accessor :has_mismatched_bank_country

    # True if the browser time zone and IP address associated time zone are not the same.
    attr_accessor :has_mismatched_time_zone

    # True if the customer's name from billing address and from customer's primary address are not the same.
    attr_accessor :has_mismatched_holder_name

    # True if the holder name seems fake.
    attr_accessor :has_fake_name

    # True if geo-IP country or the customer's billing country is considered a high risk country.
    attr_accessor :is_high_risk_country

    # Number of transactions for this payment instrument (based on fingerprint) in the last 24 hours.
    attr_accessor :payment_instrument_velocity

    # Number of transactions for this device (based on fingerprint) in the last 24 hours.
    attr_accessor :device_velocity

    # Number of transactions for this ip address in the last 24 hours.
    attr_accessor :ip_velocity

    # Number of transactions for this email address in the last 24 hours.
    attr_accessor :email_velocity

    # Number of transactions for this billing address in the last 24 hours.
    attr_accessor :billing_address_velocity

    # Risk score computed per all the factors.
    attr_accessor :score

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'ip_address' => :'ipAddress',
        :'fingerprint' => :'fingerprint',
        :'http_headers' => :'httpHeaders',
        :'browser_data' => :'browserData',
        :'extra_data' => :'extraData',
        :'is_proxy' => :'isProxy',
        :'is_vpn' => :'isVpn',
        :'is_tor' => :'isTor',
        :'is_hosting' => :'isHosting',
        :'vpn_service_name' => :'vpnServiceName',
        :'isp' => :'isp',
        :'country' => :'country',
        :'region' => :'region',
        :'city' => :'city',
        :'latitude' => :'latitude',
        :'longitude' => :'longitude',
        :'postal_code' => :'postalCode',
        :'time_zone' => :'timeZone',
        :'accuracy_radius' => :'accuracyRadius',
        :'distance' => :'distance',
        :'has_mismatched_billing_address_country' => :'hasMismatchedBillingAddressCountry',
        :'has_mismatched_bank_country' => :'hasMismatchedBankCountry',
        :'has_mismatched_time_zone' => :'hasMismatchedTimeZone',
        :'has_mismatched_holder_name' => :'hasMismatchedHolderName',
        :'has_fake_name' => :'hasFakeName',
        :'is_high_risk_country' => :'isHighRiskCountry',
        :'payment_instrument_velocity' => :'paymentInstrumentVelocity',
        :'device_velocity' => :'deviceVelocity',
        :'ip_velocity' => :'ipVelocity',
        :'email_velocity' => :'emailVelocity',
        :'billing_address_velocity' => :'billingAddressVelocity',
        :'score' => :'score'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'ip_address' => :'Object',
        :'fingerprint' => :'Object',
        :'http_headers' => :'Object',
        :'browser_data' => :'Object',
        :'extra_data' => :'Object',
        :'is_proxy' => :'Object',
        :'is_vpn' => :'Object',
        :'is_tor' => :'Object',
        :'is_hosting' => :'Object',
        :'vpn_service_name' => :'Object',
        :'isp' => :'Object',
        :'country' => :'Object',
        :'region' => :'Object',
        :'city' => :'Object',
        :'latitude' => :'Object',
        :'longitude' => :'Object',
        :'postal_code' => :'Object',
        :'time_zone' => :'Object',
        :'accuracy_radius' => :'Object',
        :'distance' => :'Object',
        :'has_mismatched_billing_address_country' => :'Object',
        :'has_mismatched_bank_country' => :'Object',
        :'has_mismatched_time_zone' => :'Object',
        :'has_mismatched_holder_name' => :'Object',
        :'has_fake_name' => :'Object',
        :'is_high_risk_country' => :'Object',
        :'payment_instrument_velocity' => :'Object',
        :'device_velocity' => :'Object',
        :'ip_velocity' => :'Object',
        :'email_velocity' => :'Object',
        :'billing_address_velocity' => :'Object',
        :'score' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::RiskMetadata` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::RiskMetadata`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'ip_address')
        self.ip_address = attributes[:'ip_address']
      end

      if attributes.key?(:'fingerprint')
        self.fingerprint = attributes[:'fingerprint']
      end

      if attributes.key?(:'http_headers')
        self.http_headers = attributes[:'http_headers']
      end

      if attributes.key?(:'browser_data')
        self.browser_data = attributes[:'browser_data']
      end

      if attributes.key?(:'extra_data')
        self.extra_data = attributes[:'extra_data']
      end

      if attributes.key?(:'is_proxy')
        self.is_proxy = attributes[:'is_proxy']
      end

      if attributes.key?(:'is_vpn')
        self.is_vpn = attributes[:'is_vpn']
      end

      if attributes.key?(:'is_tor')
        self.is_tor = attributes[:'is_tor']
      end

      if attributes.key?(:'is_hosting')
        self.is_hosting = attributes[:'is_hosting']
      end

      if attributes.key?(:'vpn_service_name')
        self.vpn_service_name = attributes[:'vpn_service_name']
      end

      if attributes.key?(:'isp')
        self.isp = attributes[:'isp']
      end

      if attributes.key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.key?(:'region')
        self.region = attributes[:'region']
      end

      if attributes.key?(:'city')
        self.city = attributes[:'city']
      end

      if attributes.key?(:'latitude')
        self.latitude = attributes[:'latitude']
      end

      if attributes.key?(:'longitude')
        self.longitude = attributes[:'longitude']
      end

      if attributes.key?(:'postal_code')
        self.postal_code = attributes[:'postal_code']
      end

      if attributes.key?(:'time_zone')
        self.time_zone = attributes[:'time_zone']
      end

      if attributes.key?(:'accuracy_radius')
        self.accuracy_radius = attributes[:'accuracy_radius']
      end

      if attributes.key?(:'distance')
        self.distance = attributes[:'distance']
      end

      if attributes.key?(:'has_mismatched_billing_address_country')
        self.has_mismatched_billing_address_country = attributes[:'has_mismatched_billing_address_country']
      end

      if attributes.key?(:'has_mismatched_bank_country')
        self.has_mismatched_bank_country = attributes[:'has_mismatched_bank_country']
      end

      if attributes.key?(:'has_mismatched_time_zone')
        self.has_mismatched_time_zone = attributes[:'has_mismatched_time_zone']
      end

      if attributes.key?(:'has_mismatched_holder_name')
        self.has_mismatched_holder_name = attributes[:'has_mismatched_holder_name']
      end

      if attributes.key?(:'has_fake_name')
        self.has_fake_name = attributes[:'has_fake_name']
      end

      if attributes.key?(:'is_high_risk_country')
        self.is_high_risk_country = attributes[:'is_high_risk_country']
      end

      if attributes.key?(:'payment_instrument_velocity')
        self.payment_instrument_velocity = attributes[:'payment_instrument_velocity']
      end

      if attributes.key?(:'device_velocity')
        self.device_velocity = attributes[:'device_velocity']
      end

      if attributes.key?(:'ip_velocity')
        self.ip_velocity = attributes[:'ip_velocity']
      end

      if attributes.key?(:'email_velocity')
        self.email_velocity = attributes[:'email_velocity']
      end

      if attributes.key?(:'billing_address_velocity')
        self.billing_address_velocity = attributes[:'billing_address_velocity']
      end

      if attributes.key?(:'score')
        self.score = attributes[:'score']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          ip_address == o.ip_address &&
          fingerprint == o.fingerprint &&
          http_headers == o.http_headers &&
          browser_data == o.browser_data &&
          extra_data == o.extra_data &&
          is_proxy == o.is_proxy &&
          is_vpn == o.is_vpn &&
          is_tor == o.is_tor &&
          is_hosting == o.is_hosting &&
          vpn_service_name == o.vpn_service_name &&
          isp == o.isp &&
          country == o.country &&
          region == o.region &&
          city == o.city &&
          latitude == o.latitude &&
          longitude == o.longitude &&
          postal_code == o.postal_code &&
          time_zone == o.time_zone &&
          accuracy_radius == o.accuracy_radius &&
          distance == o.distance &&
          has_mismatched_billing_address_country == o.has_mismatched_billing_address_country &&
          has_mismatched_bank_country == o.has_mismatched_bank_country &&
          has_mismatched_time_zone == o.has_mismatched_time_zone &&
          has_mismatched_holder_name == o.has_mismatched_holder_name &&
          has_fake_name == o.has_fake_name &&
          is_high_risk_country == o.is_high_risk_country &&
          payment_instrument_velocity == o.payment_instrument_velocity &&
          device_velocity == o.device_velocity &&
          ip_velocity == o.ip_velocity &&
          email_velocity == o.email_velocity &&
          billing_address_velocity == o.billing_address_velocity &&
          score == o.score
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [ip_address, fingerprint, http_headers, browser_data, extra_data, is_proxy, is_vpn, is_tor, is_hosting, vpn_service_name, isp, country, region, city, latitude, longitude, postal_code, time_zone, accuracy_radius, distance, has_mismatched_billing_address_country, has_mismatched_bank_country, has_mismatched_time_zone, has_mismatched_holder_name, has_fake_name, is_high_risk_country, payment_instrument_velocity, device_velocity, ip_velocity, email_velocity, billing_address_velocity, score].hash
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
