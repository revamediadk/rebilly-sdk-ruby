# RebillySdk::SubscriptionCancellation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfSubscriptionCancellationId**](AllOfSubscriptionCancellationId.md) | Cancellation identifier. | [optional] 
**subscription_id** | [**AllOfSubscriptionCancellationSubscriptionId**](AllOfSubscriptionCancellationSubscriptionId.md) | Identifier of the canceled subscription order. | 
**prorated_invoice_id** | [**AllOfSubscriptionCancellationProratedInvoiceId**](AllOfSubscriptionCancellationProratedInvoiceId.md) | Identifier of the invoice on which the cancellation proration is calculated. | [optional] 
**applied_invoice_id** | [**AllOfSubscriptionCancellationAppliedInvoiceId**](AllOfSubscriptionCancellationAppliedInvoiceId.md) | The identifier of the invoice where the cancellation fees or credits are applied. | [optional] 
**canceled_by** | **String** | Who did the cancellation. | [optional] [default to &#x27;customer&#x27;]
**reason** | **String** | Cancellation reason. | [optional] [default to &#x27;other&#x27;]
**description** | **String** | Cancel reason description in free form. | [optional] 
**prorated** | **BOOLEAN** | Defines if the customer gets a pro-rata credit for the time remaining between &#x60;churnTime&#x60; and subscription&#x27;s next renewal time.  | [optional] [default to false]
**status** | **String** | \&quot;draft\&quot; defines that the cancellation isn&#x27;t applied on an invoice and subscription but can be inspected to see the charge. \&quot;confirmed\&quot; will set a subscription to be canceled when the &#x60;churnTime&#x60; is reached. \&quot;completed\&quot; is a read-only status which is set by the system when the churnTime is reached. The cancellation may not be changed or deleted when the status is \&quot;completed\&quot;.  | [optional] [default to &#x27;confirmed&#x27;]
**canceled_time** | **DateTime** | The cancellation time (when the status is confirmed which is by default unless specified \&quot;draft\&quot;). | [optional] 
**created_time** | [**AllOfSubscriptionCancellationCreatedTime**](AllOfSubscriptionCancellationCreatedTime.md) | The time of resource creation (when it is posted). | [optional] 
**churn_time** | **DateTime** | The time when the subscription will be deactivated. | 
**line_items** | [**AllOfSubscriptionCancellationLineItems**](AllOfSubscriptionCancellationLineItems.md) | Items to be added to the new invoice. Proration item is generated and added automatically. | [optional] 
**line_item_subtotal** | [**BigDecimal**](BigDecimal.md) | Subtotal of the line items which will be added after the subscription&#x27;s cancellation. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

