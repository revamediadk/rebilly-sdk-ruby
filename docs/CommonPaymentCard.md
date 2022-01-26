# RebillySdk::CommonPaymentCard

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonPaymentCardId**](AllOfCommonPaymentCardId.md) | The payment instrument ID. | [optional] 
**method** | **String** | The method of payment instrument. | [optional] 
**customer_id** | [**AllOfCommonPaymentCardCustomerId**](AllOfCommonPaymentCardCustomerId.md) | The customer ID. | [optional] 
**status** | **String** | Payment instrument status. When an instrument is &#x60;active&#x60; it means it has been used at least once for an approved transaction. To remove an instrument from being in use, set it as &#x60;deactivated&#x60; (see the deactivation endpoint).  | [optional] 
**fingerprint** | **String** | A unique value to identify the payment instrument regardless of variable values. It contains alphanumeric values. | [optional] 
**bin** | **String** | The card&#x27;s bin (the PAN&#x27;s first 6 digits). | [optional] 
**last4** | **String** | The PAN&#x27;s last 4 digits. | [optional] 
**pan** | **String** | The card PAN (primary account number). | [optional] 
**exp_year** | **Integer** | Card&#x27;s expiration year. | [optional] 
**exp_month** | **Integer** | Card&#x27;s expiration month. | [optional] 
**cvv** | **String** | Card&#x27;s cvv (card verification value). | [optional] 
**brand** | [**AllOfCommonPaymentCardBrand**](AllOfCommonPaymentCardBrand.md) |  | [optional] 
**bank_country** | **String** | Payment instrument bank country. | [optional] 
**bank_name** | **String** | Payment instrument bank name. | [optional] 
**billing_address** | [**AllOfCommonPaymentCardBillingAddress**](AllOfCommonPaymentCardBillingAddress.md) | The billing address. | [optional] 
**created_time** | [**AllOfCommonPaymentCardCreatedTime**](AllOfCommonPaymentCardCreatedTime.md) | Payment instrument created time. | [optional] 
**updated_time** | [**AllOfCommonPaymentCardUpdatedTime**](AllOfCommonPaymentCardUpdatedTime.md) | Payment instrument updated time. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 

