# RebillySdk::BankAccount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The payment instrument ID. | [optional] 
**method** | **String** | The method of payment instrument. | [optional] 
**customer_id** | [****](.md) | The customer&#x27;s ID. | [optional] 
**bank_name** | **String** | Bank&#x27;s name. | [optional] 
**routing_number** | **String** | Bank&#x27;s routing number. | [optional] 
**account_number_type** | **String** | Bank&#x27;s account number type. A valid value is basic bank account number (BBAN) or international bank account number (IBAN). | [optional] [default to &#x27;BBAN&#x27;]
**account_type** | **String** | Bank&#x27;s account type. | [optional] 
**bic** | **String** | Bank Identifier Code. | [optional] 
**billing_address** | [****](.md) | The billing address. | [optional] 
**fingerprint** | **String** | A unique value to identify the bank account. It contains alphanumeric values. | [optional] 
**last4** | **String** | The last 4 digits of the bank account. | [optional] 
**status** | **String** | Bank account status. | [optional] 
**created_time** | [****](.md) | Bank account created time. | [optional] 
**updated_time** | [****](.md) | Bank account updated time. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

