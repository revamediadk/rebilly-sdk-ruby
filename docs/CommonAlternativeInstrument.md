# RebillySdk::CommonAlternativeInstrument

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonAlternativeInstrumentId**](AllOfCommonAlternativeInstrumentId.md) | The payment instrument ID. | [optional] 
**method** | [**AllOfCommonAlternativeInstrumentMethod**](AllOfCommonAlternativeInstrumentMethod.md) | The method of payment instrument. | 
**customer_id** | [**AllOfCommonAlternativeInstrumentCustomerId**](AllOfCommonAlternativeInstrumentCustomerId.md) | Customer&#x27;s ID. | 
**billing_address** | [**AllOfCommonAlternativeInstrumentBillingAddress**](AllOfCommonAlternativeInstrumentBillingAddress.md) | The billing address. | 
**status** | **String** | The payment instrument status. | [optional] 
**created_time** | [**AllOfCommonAlternativeInstrumentCreatedTime**](AllOfCommonAlternativeInstrumentCreatedTime.md) | The payment instrument created time. | [optional] 
**updated_time** | [**AllOfCommonAlternativeInstrumentUpdatedTime**](AllOfCommonAlternativeInstrumentUpdatedTime.md) | The payment instrument updated time. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 
**_links** | [**Array&lt;AnyOfCommonAlternativeInstrumentLinksItems&gt;**](.md) | Links related to the resource. | [optional] 
**_embedded** | [**Array&lt;AnyOfCommonAlternativeInstrumentEmbeddedItems&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

