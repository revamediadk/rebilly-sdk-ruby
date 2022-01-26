# RebillySdk::AllOfSearchCustomersItems

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The customer identifier string. | [optional] 
**email** | **String** | The customer&#x27;s email. | [optional] 
**first_name** | **String** | The customer&#x27;s first name. | [optional] 
**last_name** | **String** | The customer&#x27;s last name. | [optional] 
**website_id** | [****](.md) | The website&#x27;s ID. | [optional] 
**payment_token** | **String** | A write-only payment token; if supplied, it will be converted into a payment instrument and be set as the &#x60;defaultPaymentInstrument&#x60;. The value of this property will override the &#x60;defaultPaymentInstrument&#x60; in the case that both are supplied. The token may only be used once before it is expired.  | [optional] 
**default_payment_instrument** | [**PaymentInstrument**](PaymentInstrument.md) |  | [optional] 
**created_time** | [****](.md) | The customer created time. | [optional] 
**updated_time** | [****](.md) | The customer updated time. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**primary_address** | [**ContactObject**](ContactObject.md) |  | [optional] 
**average_value** | [**CustomerAverageValue**](CustomerAverageValue.md) |  | [optional] 
**payment_count** | **Integer** | The number of approved payments for the customer. | [optional] 
**last_payment_time** | [****](.md) | The most recent time of an approved payment for the customer. | [optional] 
**lifetime_revenue** | [**CustomerLifetimeRevenue**](CustomerLifetimeRevenue.md) |  | [optional] 
**invoice_count** | **Integer** | An auto-incrementing number based on the sequence of invoices. If set to 0, then this record is a Lead, otherwise is a Customer. | [optional] 
**tags** | [**Array&lt;Tag&gt;**](Tag.md) | A list of customer&#x27;s tags. | [optional] 
**revision** | **Integer** | The number of times the customer data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation.  | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

