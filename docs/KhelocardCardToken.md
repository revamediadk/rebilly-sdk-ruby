# RebillySdk::KhelocardCardToken

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The token identifier string. | [optional] 
**is_used** | **BOOLEAN** | Whether the token was already used. | [optional] [default to false]
**method** | **String** | The token method. | 
**risk_metadata** | [****](.md) |  | [optional] 
**lead_source** | [****](.md) |  | [optional] 
**created_time** | [****](.md) | Token created time. | [optional] 
**updated_time** | [****](.md) | Token updated time. | [optional] 
**usage_time** | [****](.md) | Token usage time. | [optional] 
**expiration_time** | [****](.md) | Token expiration time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 
**payment_instrument** | [**KhelocardCardTokenPaymentInstrument**](KhelocardCardTokenPaymentInstrument.md) |  | 
**billing_address** | [**AllOfKhelocardCardTokenBillingAddress**](AllOfKhelocardCardTokenBillingAddress.md) | The billing address object. | 

