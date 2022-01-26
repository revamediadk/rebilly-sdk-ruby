# RebillySdk::InvoiceTransaction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**transaction_id** | **String** | Transaction to be applied to the invoice. | 
**amount** | **Float** | Amount which needs to be applied to the invoice. Can&#x27;t be more than the transaction&#x27;s amount. If omitted, the lesser of the transaction&#x27;s unused amount or the invoice&#x27;s amount due will be used.  | [optional] 

