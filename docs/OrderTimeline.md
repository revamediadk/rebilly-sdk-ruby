# RebillySdk::OrderTimeline

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfOrderTimelineId**](AllOfOrderTimelineId.md) | The Timeline message identifier string. | [optional] 
**type** | **String** | Timeline message type. | [optional] 
**triggered_by** | **String** | Shows who or what triggered the Timeline message. | [optional] 
**message** | **String** | The message that describes the message details. | [optional] 
**extra_data** | [**TimelineExtraData**](TimelineExtraData.md) |  | [optional] 
**occurred_time** | [**AllOfOrderTimelineOccurredTime**](AllOfOrderTimelineOccurredTime.md) | Timeline message time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

