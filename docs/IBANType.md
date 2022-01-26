# RebillySdk::IBANType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | **String** | The method of payment instrument. | 
**customer_id** | [**AllOfIBANTypeCustomerId**](AllOfIBANTypeCustomerId.md) | Customer&#x27;s ID. | 
**account_number_type** | **String** | Bank&#x27;s Account Number type. A valid value is basic bank account number (BBAN) or international bank account number (IBAN). This is the object for the IBAN. | [default to &#x27;BBAN&#x27;]
**account_number** | **String** | Bank&#x27;s account number. Detailed information about all ISO 13616-compliant national IBAN formats is available in the [SWIFT IBAN Registry](https://www.swift.com/standards/data-standards/iban).  | 
**bank_name** | **String** | Bank&#x27;s name. | [optional] 
**bic** | **String** | Bank Identifier Code. | [optional] 
**billing_address** | [**AllOfIBANTypeBillingAddress**](AllOfIBANTypeBillingAddress.md) | The billing address. | 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 

