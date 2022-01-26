# RebillySdk::CustomerTimeline

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCustomerTimelineId**](AllOfCustomerTimelineId.md) | The Timeline message identifier string. | [optional] 
**type** | **String** | Timeline message type. | [optional] 
**custom_event_type** | **String** | Timeline custom event type. Used with &#x60;custom-event&#x60; type. Must be defined using [Customer Timeline custom event API](#operation/PostCustomerTimelineCustomEventType). | [optional] 
**custom_data** | **Object** | Timeline custom event data. Used with &#x60;custom-event&#x60; type. Will be transformed to &#x60;extraData&#x60; two-column table in response. | [optional] 
**triggered_by** | **String** | Shows who or what triggered the Timeline message. | [optional] 
**message** | **String** | The message that describes the message details. | [optional] 
**extra_data** | [**TimelineExtraData**](TimelineExtraData.md) |  | [optional] 
**occurred_time** | [**AllOfCustomerTimelineOccurredTime**](AllOfCustomerTimelineOccurredTime.md) | Timeline message time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

