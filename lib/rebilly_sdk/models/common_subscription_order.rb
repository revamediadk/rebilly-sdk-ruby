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
  class CommonSubscriptionOrder
    # The order identifier string.
    attr_accessor :id

    # Specifies the type of order, a subscription or a one-time purchase. 
    attr_accessor :order_type

    # The billing status of the most recent invoice.  It may help you determine if you should change the service status such as suspending the service. 
    attr_accessor :billing_status

    # The website identifier string.
    attr_accessor :website_id

    # The order's currency.
    attr_accessor :currency

    # The initial invoice identifier string.
    attr_accessor :initial_invoice_id

    # Most recently issued invoice identifier string. It might not be `paid` yet.
    attr_accessor :recent_invoice_id

    attr_accessor :items

    # Order delivery address.
    attr_accessor :delivery_address

    # Order billing address.
    attr_accessor :billing_address

    # Order activation time.
    attr_accessor :activation_time

    # Order void time.
    attr_accessor :void_time

    # A list of coupons to redeem on the customer and restrict to this subscription. Read more about [coupons here](https://docs.rebilly.com/docs/dashboard/marketing/coupons-and-discounts/).  This parameter respects the following logic:  - When not passed then applied coupons will not be changed.  - When empty array passed then all applied coupon redemptions will be canceled.  - When list of coupons is passed then not applied yet coupons will be applied, already applied coupons will not change their state, applied coupons that are not presented in passed list will be canceled.  If list of applied coupons on pending order will be changed due to this param during update order,  Invoice for the order will be reissued. 
    attr_accessor :coupon_ids

    # Purchase order number, will be displayed on the issued invoices.
    attr_accessor :po_number

    attr_accessor :shipping

    # Notes for the customer which will be displayed on the order invoice.
    attr_accessor :notes

    # The status of the subscription service. A subscription starts in the `pending` status, and will become `active` when the service period begins. 
    attr_accessor :status

    # True if the subscription is currently in a trial period.
    attr_accessor :in_trial

    attr_accessor :trial

    # Whether a subscription ends after a trial period. Recurring settings are ignored if it's `true`.
    attr_accessor :is_trial_only

    # You can shift issue time and due time of invoices for this subscription. This setting overrides plan settings. To use plan settings, set `null`. To use multiple plans in one subscription they all must have the same billing period, this property allows to subscribe to different plans. 
    attr_accessor :invoice_time_shift

    attr_accessor :recurring_interval

    # Autopay determines if a payment attempt will be automatic.
    attr_accessor :autopay

    # Subscription start time.  When the value is sent as null, it will use the current time. This value can't be in past more than one service period.
    attr_accessor :start_time

    # Subscription end time.
    attr_accessor :end_time

    # Subscription renewal time.
    attr_accessor :renewal_time

    # The current period number.
    attr_accessor :rebill_number

    # Subscription line items which queue until the next renewal (or interim) invoice is issued for the subscription.
    attr_accessor :line_items

    attr_accessor :line_item_subtotal

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
        :'order_type' => :'orderType',
        :'billing_status' => :'billingStatus',
        :'website_id' => :'websiteId',
        :'currency' => :'currency',
        :'initial_invoice_id' => :'initialInvoiceId',
        :'recent_invoice_id' => :'recentInvoiceId',
        :'items' => :'items',
        :'delivery_address' => :'deliveryAddress',
        :'billing_address' => :'billingAddress',
        :'activation_time' => :'activationTime',
        :'void_time' => :'voidTime',
        :'coupon_ids' => :'couponIds',
        :'po_number' => :'poNumber',
        :'shipping' => :'shipping',
        :'notes' => :'notes',
        :'status' => :'status',
        :'in_trial' => :'inTrial',
        :'trial' => :'trial',
        :'is_trial_only' => :'isTrialOnly',
        :'invoice_time_shift' => :'invoiceTimeShift',
        :'recurring_interval' => :'recurringInterval',
        :'autopay' => :'autopay',
        :'start_time' => :'startTime',
        :'end_time' => :'endTime',
        :'renewal_time' => :'renewalTime',
        :'rebill_number' => :'rebillNumber',
        :'line_items' => :'lineItems',
        :'line_item_subtotal' => :'lineItemSubtotal'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'order_type' => :'String',
        :'billing_status' => :'String',
        :'website_id' => :'String',
        :'currency' => :'String',
        :'initial_invoice_id' => :'String',
        :'recent_invoice_id' => :'String',
        :'items' => :'Object',
        :'delivery_address' => :'String',
        :'billing_address' => :'String',
        :'activation_time' => :'String',
        :'void_time' => :'String',
        :'coupon_ids' => :'String',
        :'po_number' => :'String',
        :'shipping' => :'String',
        :'notes' => :'String',
        :'status' => :'String',
        :'in_trial' => :'String',
        :'trial' => :'Object',
        :'is_trial_only' => :'String',
        :'invoice_time_shift' => :'String',
        :'recurring_interval' => :'String',
        :'autopay' => :'String',
        :'start_time' => :'String',
        :'end_time' => :'String',
        :'renewal_time' => :'String',
        :'rebill_number' => :'String',
        :'line_items' => :'String',
        :'line_item_subtotal' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'delivery_address',
        :'billing_address',
        :'coupon_ids',
        :'po_number',
        :'invoice_time_shift',
        :'start_time',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::CommonSubscriptionOrder` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::CommonSubscriptionOrder`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      # super(attributes)

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'order_type')
        self.order_type = attributes[:'order_type']
      else
        self.order_type = 'subscription-order'
      end

      if attributes.key?(:'billing_status')
        self.billing_status = attributes[:'billing_status']
      end

      if attributes.key?(:'website_id')
        self.website_id = attributes[:'website_id']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'initial_invoice_id')
        self.initial_invoice_id = attributes[:'initial_invoice_id']
      end

      if attributes.key?(:'recent_invoice_id')
        self.recent_invoice_id = attributes[:'recent_invoice_id']
      end

      if attributes.key?(:'items')
        if (value = attributes[:'items']).is_a?(Array)
          self.items = value
        end
      end

      if attributes.key?(:'delivery_address')
        self.delivery_address = attributes[:'delivery_address']
      end

      if attributes.key?(:'billing_address')
        self.billing_address = attributes[:'billing_address']
      end

      if attributes.key?(:'activation_time')
        self.activation_time = attributes[:'activation_time']
      end

      if attributes.key?(:'void_time')
        self.void_time = attributes[:'void_time']
      end

      if attributes.key?(:'coupon_ids')
        if (value = attributes[:'coupon_ids']).is_a?(Array)
          self.coupon_ids = value
        end
      end

      if attributes.key?(:'po_number')
        self.po_number = attributes[:'po_number']
      end

      if attributes.key?(:'shipping')
        self.shipping = attributes[:'shipping']
      end

      if attributes.key?(:'notes')
        self.notes = attributes[:'notes']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'in_trial')
        self.in_trial = attributes[:'in_trial']
      end

      if attributes.key?(:'trial')
        self.trial = attributes[:'trial']
      end

      if attributes.key?(:'is_trial_only')
        self.is_trial_only = attributes[:'is_trial_only']
      else
        self.is_trial_only = false
      end

      if attributes.key?(:'invoice_time_shift')
        self.invoice_time_shift = attributes[:'invoice_time_shift']
      end

      if attributes.key?(:'recurring_interval')
        self.recurring_interval = attributes[:'recurring_interval']
      end

      if attributes.key?(:'autopay')
        self.autopay = attributes[:'autopay']
      else
        self.autopay = true
      end

      if attributes.key?(:'start_time')
        self.start_time = attributes[:'start_time']
      end

      if attributes.key?(:'end_time')
        self.end_time = attributes[:'end_time']
      end

      if attributes.key?(:'renewal_time')
        self.renewal_time = attributes[:'renewal_time']
      end

      if attributes.key?(:'rebill_number')
        self.rebill_number = attributes[:'rebill_number']
      end

      if attributes.key?(:'line_items')
        self.line_items = attributes[:'line_items']
      end

      if attributes.key?(:'line_item_subtotal')
        self.line_item_subtotal = attributes[:'line_item_subtotal']
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
      order_type_validator = EnumAttributeValidator.new('', ['subscription-order', 'one-time-order'])
      return false unless order_type_validator.valid?(@order_type)
      billing_status_validator = EnumAttributeValidator.new('', ['draft', 'unpaid', 'past-due', 'abandoned', 'paid', 'voided', 'refunded', 'disputed', 'partially-refunded', 'partially-paid'])
      return false unless billing_status_validator.valid?(@billing_status)
      status_validator = EnumAttributeValidator.new('', ['pending', 'active', 'canceled', 'churned', 'paused', 'voided', 'completed', 'trial-ended'])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] order_type Object to be assigned
    def order_type=(order_type)
      validator = EnumAttributeValidator.new('', ['subscription-order', 'one-time-order'])
      unless validator.valid?(order_type)
        fail ArgumentError, "invalid value for \"order_type\", must be one of #{validator.allowable_values}."
      end
      @order_type = order_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] billing_status Object to be assigned
    def billing_status=(billing_status)
      validator = EnumAttributeValidator.new('', ['draft', 'unpaid', 'past-due', 'abandoned', 'paid', 'voided', 'refunded', 'disputed', 'partially-refunded', 'partially-paid'])
      unless validator.valid?(billing_status)
        fail ArgumentError, "invalid value for \"billing_status\", must be one of #{validator.allowable_values}."
      end
      @billing_status = billing_status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('', ['pending', 'active', 'canceled', 'churned', 'paused', 'voided', 'completed', 'trial-ended'])
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
          order_type == o.order_type &&
          billing_status == o.billing_status &&
          website_id == o.website_id &&
          currency == o.currency &&
          initial_invoice_id == o.initial_invoice_id &&
          recent_invoice_id == o.recent_invoice_id &&
          items == o.items &&
          delivery_address == o.delivery_address &&
          billing_address == o.billing_address &&
          activation_time == o.activation_time &&
          void_time == o.void_time &&
          coupon_ids == o.coupon_ids &&
          po_number == o.po_number &&
          shipping == o.shipping &&
          notes == o.notes &&
          status == o.status &&
          in_trial == o.in_trial &&
          trial == o.trial &&
          is_trial_only == o.is_trial_only &&
          invoice_time_shift == o.invoice_time_shift &&
          recurring_interval == o.recurring_interval &&
          autopay == o.autopay &&
          start_time == o.start_time &&
          end_time == o.end_time &&
          renewal_time == o.renewal_time &&
          rebill_number == o.rebill_number &&
          line_items == o.line_items &&
          line_item_subtotal == o.line_item_subtotal && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, order_type, billing_status, website_id, currency, initial_invoice_id, recent_invoice_id, items, delivery_address, billing_address, activation_time, void_time, coupon_ids, po_number, shipping, notes, status, in_trial, trial, is_trial_only, invoice_time_shift, recurring_interval, autopay, start_time, end_time, renewal_time, rebill_number, line_items, line_item_subtotal].hash
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
      # super(attributes)
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
