# RebillySdk::CommonInvoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonInvoiceId**](AllOfCommonInvoiceId.md) | The invoice ID. | [optional] 
**website_id** | [**AllOfCommonInvoiceWebsiteId**](AllOfCommonInvoiceWebsiteId.md) | The website ID. | 
**invoice_number** | **Integer** | An auto-incrementing number based on the sequence of invoices for any particular customer. | [optional] 
**subscription_id** | [**AllOfCommonInvoiceSubscriptionId**](AllOfCommonInvoiceSubscriptionId.md) | The related order&#x27;s ID if available, otherwise null. | [optional] 
**currency** | [**AllOfCommonInvoiceCurrency**](AllOfCommonInvoiceCurrency.md) |  | 
**amount** | **Float** | The invoice&#x27;s amount. | [optional] 
**amount_due** | **Float** | The invoice&#x27;s due amount. | [optional] 
**subtotal_amount** | **Float** | The invoice&#x27;s subtotal amount. | [optional] 
**discount_amount** | **Float** | The invoice&#x27;s discounts amount. | [optional] 
**shipping** | [**Shipping**](Shipping.md) |  | [optional] 
**tax** | [**InvoiceTax**](InvoiceTax.md) |  | [optional] 
**billing_address** | [**AllOfCommonInvoiceBillingAddress**](AllOfCommonInvoiceBillingAddress.md) | Invoice&#x27;s billing address. | [optional] 
**delivery_address** | [**AllOfCommonInvoiceDeliveryAddress**](AllOfCommonInvoiceDeliveryAddress.md) | Invoice&#x27;s delivery address. | [optional] 
**po_number** | **String** | Purchase order number which will be displayed on the invoice. | [optional] 
**notes** | **String** | Notes for the customer which will be displayed on the invoice. | [optional] 
**items** | [**Array&lt;InvoiceItem&gt;**](InvoiceItem.md) | Invoice items array. | [optional] 
**discounts** | [**Array&lt;AllOfCommonInvoiceDiscountsItems&gt;**](.md) | Discounts applied. | [optional] 
**autopay_scheduled_time** | **DateTime** | Invoice autopay scheduled time. | [optional] 
**autopay_retry_number** | **Integer** | Invoice autopay retry number. | [optional] [default to 0]
**status** | **String** | Invoice status. | [optional] 
**delinquent_collection_period** | **Integer** | Delinquent collection period - difference between paidTime and dueTime in days. | [optional] 
**collection_period** | **Integer** | Collection period - difference between paidTime and issuedTime in days. | [optional] 
**abandoned_time** | [**AllOfCommonInvoiceAbandonedTime**](AllOfCommonInvoiceAbandonedTime.md) | Invoice abandoned time. | [optional] 
**voided_time** | [**AllOfCommonInvoiceVoidedTime**](AllOfCommonInvoiceVoidedTime.md) | Invoice voided time. | [optional] 
**paid_time** | [**AllOfCommonInvoicePaidTime**](AllOfCommonInvoicePaidTime.md) | Invoice paid time. | [optional] 
**due_time** | **DateTime** | Invoice due time. | [optional] 
**issued_time** | [**AllOfCommonInvoiceIssuedTime**](AllOfCommonInvoiceIssuedTime.md) | Invoice issued time. | [optional] 
**created_time** | [**AllOfCommonInvoiceCreatedTime**](AllOfCommonInvoiceCreatedTime.md) | Invoice created time. | [optional] 
**updated_time** | [**AllOfCommonInvoiceUpdatedTime**](AllOfCommonInvoiceUpdatedTime.md) | Invoice updated time. | [optional] 
**payment_form_url** | **String** | URL where the customer can be redirected to pay for the invoice with one of the methods which are available for this customer. It&#x27;s an alternative to creating a new transaction with empty &#x60;methods&#x60;.  | [optional] 

