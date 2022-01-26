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
  class Invoice
    # The invoice ID.
    attr_accessor :id

    # The website ID.
    attr_accessor :website_id

    # An auto-incrementing number based on the sequence of invoices for any particular customer.
    attr_accessor :invoice_number

    # The related order's ID if available, otherwise null.
    attr_accessor :subscription_id

    attr_accessor :currency

    # The invoice's amount.
    attr_accessor :amount

    # The invoice's due amount.
    attr_accessor :amount_due

    # The invoice's subtotal amount.
    attr_accessor :subtotal_amount

    # The invoice's discounts amount.
    attr_accessor :discount_amount

    attr_accessor :shipping

    attr_accessor :tax

    # Invoice's billing address.
    attr_accessor :billing_address

    # Invoice's delivery address.
    attr_accessor :delivery_address

    # Purchase order number which will be displayed on the invoice.
    attr_accessor :po_number

    # Notes for the customer which will be displayed on the invoice.
    attr_accessor :notes

    # Invoice items array.
    attr_accessor :items

    # Discounts applied.
    attr_accessor :discounts

    # Invoice autopay scheduled time.
    attr_accessor :autopay_scheduled_time

    # Invoice autopay retry number.
    attr_accessor :autopay_retry_number

    # Invoice status.
    attr_accessor :status

    # Delinquent collection period - difference between paidTime and dueTime in days.
    attr_accessor :delinquent_collection_period

    # Collection period - difference between paidTime and issuedTime in days.
    attr_accessor :collection_period

    # Invoice abandoned time.
    attr_accessor :abandoned_time

    # Invoice voided time.
    attr_accessor :voided_time

    # Invoice paid time.
    attr_accessor :paid_time

    # Invoice due time.
    attr_accessor :due_time

    # Invoice issued time.
    attr_accessor :issued_time

    # Invoice created time.
    attr_accessor :created_time

    # Invoice updated time.
    attr_accessor :updated_time

    # URL where the customer can be redirected to pay for the invoice with one of the methods which are available for this customer. It's an alternative to creating a new transaction with empty `methods`. 
    attr_accessor :payment_form_url

    # The customer ID.
    attr_accessor :customer_id

    # Invoice transactions array.
    attr_accessor :transactions

    attr_accessor :retry_instruction

    # The number of times the invoice data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation. 
    attr_accessor :revision

    # Invoice type.
    attr_accessor :type

    # Time past due reminder event will be triggered.
    attr_accessor :due_reminder_time

    # Number of past due reminder events triggered.
    attr_accessor :due_reminder_number

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
        :'website_id' => :'websiteId',
        :'invoice_number' => :'invoiceNumber',
        :'subscription_id' => :'subscriptionId',
        :'currency' => :'currency',
        :'amount' => :'amount',
        :'amount_due' => :'amountDue',
        :'subtotal_amount' => :'subtotalAmount',
        :'discount_amount' => :'discountAmount',
        :'shipping' => :'shipping',
        :'tax' => :'tax',
        :'billing_address' => :'billingAddress',
        :'delivery_address' => :'deliveryAddress',
        :'po_number' => :'poNumber',
        :'notes' => :'notes',
        :'items' => :'items',
        :'discounts' => :'discounts',
        :'autopay_scheduled_time' => :'autopayScheduledTime',
        :'autopay_retry_number' => :'autopayRetryNumber',
        :'status' => :'status',
        :'delinquent_collection_period' => :'delinquentCollectionPeriod',
        :'collection_period' => :'collectionPeriod',
        :'abandoned_time' => :'abandonedTime',
        :'voided_time' => :'voidedTime',
        :'paid_time' => :'paidTime',
        :'due_time' => :'dueTime',
        :'issued_time' => :'issuedTime',
        :'created_time' => :'createdTime',
        :'updated_time' => :'updatedTime',
        :'payment_form_url' => :'paymentFormUrl',
        :'customer_id' => :'customerId',
        :'transactions' => :'transactions',
        :'retry_instruction' => :'retryInstruction',
        :'revision' => :'revision',
        :'type' => :'type',
        :'due_reminder_time' => :'dueReminderTime',
        :'due_reminder_number' => :'dueReminderNumber',
        :'_links' => :'_links',
        :'_embedded' => :'_embedded'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'',
        :'website_id' => :'',
        :'invoice_number' => :'',
        :'subscription_id' => :'',
        :'currency' => :'',
        :'amount' => :'',
        :'amount_due' => :'',
        :'subtotal_amount' => :'',
        :'discount_amount' => :'',
        :'shipping' => :'',
        :'tax' => :'',
        :'billing_address' => :'',
        :'delivery_address' => :'',
        :'po_number' => :'',
        :'notes' => :'',
        :'items' => :'',
        :'discounts' => :'',
        :'autopay_scheduled_time' => :'',
        :'autopay_retry_number' => :'',
        :'status' => :'',
        :'delinquent_collection_period' => :'',
        :'collection_period' => :'',
        :'abandoned_time' => :'',
        :'voided_time' => :'',
        :'paid_time' => :'',
        :'due_time' => :'',
        :'issued_time' => :'',
        :'created_time' => :'',
        :'updated_time' => :'',
        :'payment_form_url' => :'',
        :'customer_id' => :'',
        :'transactions' => :'',
        :'retry_instruction' => :'',
        :'revision' => :'',
        :'type' => :'',
        :'due_reminder_time' => :'',
        :'due_reminder_number' => :'',
        :'_links' => :'',
        :'_embedded' => :''
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'po_number',
        :'due_reminder_time',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::Invoice` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::Invoice`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'website_id')
        self.website_id = attributes[:'website_id']
      end

      if attributes.key?(:'invoice_number')
        self.invoice_number = attributes[:'invoice_number']
      end

      if attributes.key?(:'subscription_id')
        self.subscription_id = attributes[:'subscription_id']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'amount_due')
        self.amount_due = attributes[:'amount_due']
      end

      if attributes.key?(:'subtotal_amount')
        self.subtotal_amount = attributes[:'subtotal_amount']
      end

      if attributes.key?(:'discount_amount')
        self.discount_amount = attributes[:'discount_amount']
      end

      if attributes.key?(:'shipping')
        self.shipping = attributes[:'shipping']
      end

      if attributes.key?(:'tax')
        self.tax = attributes[:'tax']
      end

      if attributes.key?(:'billing_address')
        self.billing_address = attributes[:'billing_address']
      end

      if attributes.key?(:'delivery_address')
        self.delivery_address = attributes[:'delivery_address']
      end

      if attributes.key?(:'po_number')
        self.po_number = attributes[:'po_number']
      end

      if attributes.key?(:'notes')
        self.notes = attributes[:'notes']
      end

      if attributes.key?(:'items')
        if (value = attributes[:'items']).is_a?(Array)
          self.items = value
        end
      end

      if attributes.key?(:'discounts')
        if (value = attributes[:'discounts']).is_a?(Array)
          self.discounts = value
        end
      end

      if attributes.key?(:'autopay_scheduled_time')
        self.autopay_scheduled_time = attributes[:'autopay_scheduled_time']
      end

      if attributes.key?(:'autopay_retry_number')
        self.autopay_retry_number = attributes[:'autopay_retry_number']
      else
        self.autopay_retry_number = 0
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'delinquent_collection_period')
        self.delinquent_collection_period = attributes[:'delinquent_collection_period']
      end

      if attributes.key?(:'collection_period')
        self.collection_period = attributes[:'collection_period']
      end

      if attributes.key?(:'abandoned_time')
        self.abandoned_time = attributes[:'abandoned_time']
      end

      if attributes.key?(:'voided_time')
        self.voided_time = attributes[:'voided_time']
      end

      if attributes.key?(:'paid_time')
        self.paid_time = attributes[:'paid_time']
      end

      if attributes.key?(:'due_time')
        self.due_time = attributes[:'due_time']
      end

      if attributes.key?(:'issued_time')
        self.issued_time = attributes[:'issued_time']
      end

      if attributes.key?(:'created_time')
        self.created_time = attributes[:'created_time']
      end

      if attributes.key?(:'updated_time')
        self.updated_time = attributes[:'updated_time']
      end

      if attributes.key?(:'payment_form_url')
        self.payment_form_url = attributes[:'payment_form_url']
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      end

      if attributes.key?(:'transactions')
        if (value = attributes[:'transactions']).is_a?(Array)
          self.transactions = value
        end
      end

      if attributes.key?(:'retry_instruction')
        self.retry_instruction = attributes[:'retry_instruction']
      end

      if attributes.key?(:'revision')
        self.revision = attributes[:'revision']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'due_reminder_time')
        self.due_reminder_time = attributes[:'due_reminder_time']
      end

      if attributes.key?(:'due_reminder_number')
        self.due_reminder_number = attributes[:'due_reminder_number']
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
      if @website_id.nil?
        invalid_properties.push('invalid value for "website_id", website_id cannot be nil.')
      end

      if @currency.nil?
        invalid_properties.push('invalid value for "currency", currency cannot be nil.')
      end

      if @customer_id.nil?
        invalid_properties.push('invalid value for "customer_id", customer_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @website_id.nil?
      return false if @currency.nil?
      status_validator = EnumAttributeValidator.new('', ['draft', 'unpaid', 'paid', 'past-due', 'delinquent', 'abandoned', 'voided', 'partially-refunded', 'refunded', 'disputed'])
      return false unless status_validator.valid?(@status)
      return false if @customer_id.nil?
      type_validator = EnumAttributeValidator.new('', ['initial', 'renewal', 'interim', 'cancellation', 'one-time', 'refund', 'charge', 'one-time-sale'])
      return false unless type_validator.valid?(@type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('', ['draft', 'unpaid', 'paid', 'past-due', 'delinquent', 'abandoned', 'voided', 'partially-refunded', 'refunded', 'disputed'])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('', ['initial', 'renewal', 'interim', 'cancellation', 'one-time', 'refund', 'charge', 'one-time-sale'])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          website_id == o.website_id &&
          invoice_number == o.invoice_number &&
          subscription_id == o.subscription_id &&
          currency == o.currency &&
          amount == o.amount &&
          amount_due == o.amount_due &&
          subtotal_amount == o.subtotal_amount &&
          discount_amount == o.discount_amount &&
          shipping == o.shipping &&
          tax == o.tax &&
          billing_address == o.billing_address &&
          delivery_address == o.delivery_address &&
          po_number == o.po_number &&
          notes == o.notes &&
          items == o.items &&
          discounts == o.discounts &&
          autopay_scheduled_time == o.autopay_scheduled_time &&
          autopay_retry_number == o.autopay_retry_number &&
          status == o.status &&
          delinquent_collection_period == o.delinquent_collection_period &&
          collection_period == o.collection_period &&
          abandoned_time == o.abandoned_time &&
          voided_time == o.voided_time &&
          paid_time == o.paid_time &&
          due_time == o.due_time &&
          issued_time == o.issued_time &&
          created_time == o.created_time &&
          updated_time == o.updated_time &&
          payment_form_url == o.payment_form_url &&
          customer_id == o.customer_id &&
          transactions == o.transactions &&
          retry_instruction == o.retry_instruction &&
          revision == o.revision &&
          type == o.type &&
          due_reminder_time == o.due_reminder_time &&
          due_reminder_number == o.due_reminder_number &&
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
      [id, website_id, invoice_number, subscription_id, currency, amount, amount_due, subtotal_amount, discount_amount, shipping, tax, billing_address, delivery_address, po_number, notes, items, discounts, autopay_scheduled_time, autopay_retry_number, status, delinquent_collection_period, collection_period, abandoned_time, voided_time, paid_time, due_time, issued_time, created_time, updated_time, payment_form_url, customer_id, transactions, retry_instruction, revision, type, due_reminder_time, due_reminder_number, _links, _embedded].hash
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
