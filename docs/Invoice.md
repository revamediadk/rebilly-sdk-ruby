# RebillySdk::Invoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The invoice ID. | [optional] 
**website_id** | [****](.md) | The website ID. | 
**invoice_number** | **Integer** | An auto-incrementing number based on the sequence of invoices for any particular customer. | [optional] 
**subscription_id** | [****](.md) | The related order&#x27;s ID if available, otherwise null. | [optional] 
**currency** | [****](.md) |  | 
**amount** | **Float** | The invoice&#x27;s amount. | [optional] 
**amount_due** | **Float** | The invoice&#x27;s due amount. | [optional] 
**subtotal_amount** | **Float** | The invoice&#x27;s subtotal amount. | [optional] 
**discount_amount** | **Float** | The invoice&#x27;s discounts amount. | [optional] 
**shipping** | [**Shipping**](Shipping.md) |  | [optional] 
**tax** | [**InvoiceTax**](InvoiceTax.md) |  | [optional] 
**billing_address** | [****](.md) | Invoice&#x27;s billing address. | [optional] 
**delivery_address** | [****](.md) | Invoice&#x27;s delivery address. | [optional] 
**po_number** | **String** | Purchase order number which will be displayed on the invoice. | [optional] 
**notes** | **String** | Notes for the customer which will be displayed on the invoice. | [optional] 
**items** | [**Array&lt;InvoiceItem&gt;**](InvoiceItem.md) | Invoice items array. | [optional] 
**discounts** | [**Array&lt;null&gt;**](.md) | Discounts applied. | [optional] 
**autopay_scheduled_time** | **DateTime** | Invoice autopay scheduled time. | [optional] 
**autopay_retry_number** | **Integer** | Invoice autopay retry number. | [optional] [default to 0]
**status** | **String** | Invoice status. | [optional] 
**delinquent_collection_period** | **Integer** | Delinquent collection period - difference between paidTime and dueTime in days. | [optional] 
**collection_period** | **Integer** | Collection period - difference between paidTime and issuedTime in days. | [optional] 
**abandoned_time** | [****](.md) | Invoice abandoned time. | [optional] 
**voided_time** | [****](.md) | Invoice voided time. | [optional] 
**paid_time** | [****](.md) | Invoice paid time. | [optional] 
**due_time** | **DateTime** | Invoice due time. | [optional] 
**issued_time** | [****](.md) | Invoice issued time. | [optional] 
**created_time** | [****](.md) | Invoice created time. | [optional] 
**updated_time** | [****](.md) | Invoice updated time. | [optional] 
**payment_form_url** | **String** | URL where the customer can be redirected to pay for the invoice with one of the methods which are available for this customer. It&#x27;s an alternative to creating a new transaction with empty &#x60;methods&#x60;.  | [optional] 
**customer_id** | [****](.md) | The customer ID. | 
**transactions** | [**Array&lt;Transaction&gt;**](Transaction.md) | Invoice transactions array. | [optional] 
**retry_instruction** | [**InvoiceRetryInstruction**](InvoiceRetryInstruction.md) |  | [optional] 
**revision** | **Integer** | The number of times the invoice data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation.  | [optional] 
**type** | **String** | Invoice type. | [optional] 
**due_reminder_time** | [****](.md) | Time past due reminder event will be triggered. | [optional] 
**due_reminder_number** | **Integer** | Number of past due reminder events triggered. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

