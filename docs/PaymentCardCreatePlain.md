# RebillySdk::PaymentCardCreatePlain

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | **String** | The method of payment instrument. | 
**customer_id** | [**AllOfPaymentCardCreatePlainCustomerId**](AllOfPaymentCardCreatePlainCustomerId.md) | The Customer&#x27;s ID. | 
**pan** | **String** | The card PAN (Primary Account Number). | 
**exp_year** | **Integer** | Card&#x27;s expiration year. | 
**exp_month** | **Integer** | Card&#x27;s expiration month. | 
**cvv** | **String** | Card&#x27;s cvv (card verification value). | [optional] 
**billing_address** | [**AllOfPaymentCardCreatePlainBillingAddress**](AllOfPaymentCardCreatePlainBillingAddress.md) | The billing address. | 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 

