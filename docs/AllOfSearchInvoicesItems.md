# RebillySdk::AllOfSearchInvoicesItems

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**customer_id** | [****](.md) | The customer ID. | 
**transactions** | [**Array&lt;Transaction&gt;**](Transaction.md) | Invoice transactions array. | [optional] 
**retry_instruction** | [**InvoiceRetryInstruction**](InvoiceRetryInstruction.md) |  | [optional] 
**revision** | **Integer** | The number of times the invoice data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation.  | [optional] 
**type** | **String** | Invoice type. | [optional] 
**due_reminder_time** | [****](.md) | Time past due reminder event will be triggered. | [optional] 
**due_reminder_number** | **Integer** | Number of past due reminder events triggered. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

