# RebillySdk::KhelocardCard

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfKhelocardCardId**](AllOfKhelocardCardId.md) | The payment instrument ID. | [optional] 
**method** | **String** | The method of payment instrument. | [optional] 
**customer_id** | [**AllOfKhelocardCardCustomerId**](AllOfKhelocardCardCustomerId.md) | Customer&#x27;s ID. | [optional] 
**fingerprint** | **String** | A unique value to identify the payment instrument regardless of variable values. It contains alphanumeric values. | [optional] 
**number** | **String** | Khelocard card&#x27;s masked number. | [optional] 
**last4** | **String** | The number&#x27;s last 4 digits. | [optional] 
**exp_year** | **Integer** | Khelocard card&#x27;s expiration year. | [optional] 
**exp_month** | **Integer** | Khelocard card&#x27;s expiration month. | [optional] 
**billing_address** | [**AllOfKhelocardCardBillingAddress**](AllOfKhelocardCardBillingAddress.md) | The billing address. | [optional] 
**status** | **String** | The payment instrument status. | [optional] 
**created_time** | [**AllOfKhelocardCardCreatedTime**](AllOfKhelocardCardCreatedTime.md) | The payment instrument created time. | [optional] 
**updated_time** | [**AllOfKhelocardCardUpdatedTime**](AllOfKhelocardCardUpdatedTime.md) | The payment instrument updated time. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 
**_links** | [**Array&lt;AnyOfKhelocardCardLinksItems&gt;**](.md) | Links related to the resource. | [optional] 
**_embedded** | [**Array&lt;AnyOfKhelocardCardEmbeddedItems&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

