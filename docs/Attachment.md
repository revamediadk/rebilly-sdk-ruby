# RebillySdk::Attachment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfAttachmentId**](AllOfAttachmentId.md) |  | [optional] 
**file_id** | **String** | Linked File object id. | 
**related_type** | **String** | Linked object type. | 
**related_id** | **String** | Linked object Id. | 
**name** | **String** | The Original Attachment name. | [optional] 
**description** | **String** | The Attachment description. | [optional] 
**created_time** | [**AllOfAttachmentCreatedTime**](AllOfAttachmentCreatedTime.md) | Creation date/time. | [optional] 
**updated_time** | [**AllOfAttachmentUpdatedTime**](AllOfAttachmentUpdatedTime.md) | Latest update date/time. | [optional] 
**_links** | [**Array&lt;AnyOfAttachmentLinksItems&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;AnyOfAttachmentEmbeddedItems&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

