# RebillySdk::Dispute

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfDisputeId**](AllOfDisputeId.md) | The dispute identifier string. | [optional] 
**customer_id** | **String** | The dispute&#x27;s customer ID. | [optional] 
**transaction_id** | **String** | The dispute&#x27;s transaction ID. | 
**currency** | [**AllOfDisputeCurrency**](AllOfDisputeCurrency.md) |  | 
**amount** | **Float** | The dispute amount. | 
**acquirer_reference_number** | **String** | The dispute&#x27;s acquirer reference number. | [optional] 
**case_id** | **String** | The case ID for the dispute. | [optional] 
**reason_code** | **String** | The dispute&#x27;s reason code. | 
**category** | **String** | The dispute&#x27;s category. | [optional] 
**type** | **String** | The dispute&#x27;s type. | 
**status** | **String** | The dispute&#x27;s status. | 
**posted_time** | **DateTime** | Dispute posted time. | 
**deadline_time** | **DateTime** | Dispute deadline time. | [optional] 
**raw_response** | **String** | Dispute raw response from gateway. | [optional] 
**resolved_time** | [**AllOfDisputeResolvedTime**](AllOfDisputeResolvedTime.md) | Dispute resolved time. | [optional] 
**created_time** | [**AllOfDisputeCreatedTime**](AllOfDisputeCreatedTime.md) | Dispute created time. | [optional] 
**updated_time** | [**AllOfDisputeUpdatedTime**](AllOfDisputeUpdatedTime.md) | Dispute updated time. | [optional] 
**_links** | [**Array&lt;AnyOfDisputeLinksItems&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;AnyOfDisputeEmbeddedItems&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

