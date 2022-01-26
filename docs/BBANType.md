# RebillySdk::BBANType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | **String** | The method of payment instrument. | 
**customer_id** | [**AllOfBBANTypeCustomerId**](AllOfBBANTypeCustomerId.md) | Customer&#x27;s ID. | 
**account_number_type** | **String** | Bank&#x27;s Account Number type. A valid value is basic bank account number (BBAN) or international bank account number (IBAN). This is the object for the BBAN. | [default to &#x27;BBAN&#x27;]
**account_number** | **String** | Bank&#x27;s account number. | 
**routing_number** | **String** | Bank&#x27;s routing number. | 
**account_type** | **String** | Bank&#x27;s account type. | 
**bank_name** | **String** | Bank&#x27;s name. | [optional] 
**bic** | **String** | Bank Identifier Code. | [optional] 
**billing_address** | [**AllOfBBANTypeBillingAddress**](AllOfBBANTypeBillingAddress.md) | The billing address. | 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 

