# RebillySdk::CommonPaymentToken

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonPaymentTokenId**](AllOfCommonPaymentTokenId.md) | The token identifier string. | [optional] 
**is_used** | **BOOLEAN** | Whether the token was already used. | [optional] [default to false]
**method** | **String** |  | 
**risk_metadata** | [**AllOfCommonPaymentTokenRiskMetadata**](AllOfCommonPaymentTokenRiskMetadata.md) |  | [optional] 
**lead_source** | [**AllOfCommonPaymentTokenLeadSource**](AllOfCommonPaymentTokenLeadSource.md) |  | [optional] 
**created_time** | [**AllOfCommonPaymentTokenCreatedTime**](AllOfCommonPaymentTokenCreatedTime.md) | Token created time. | [optional] 
**updated_time** | [**AllOfCommonPaymentTokenUpdatedTime**](AllOfCommonPaymentTokenUpdatedTime.md) | Token updated time. | [optional] 
**usage_time** | [**AllOfCommonPaymentTokenUsageTime**](AllOfCommonPaymentTokenUsageTime.md) | Token usage time. | [optional] 
**expiration_time** | [**AllOfCommonPaymentTokenExpirationTime**](AllOfCommonPaymentTokenExpirationTime.md) | Token expiration time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

