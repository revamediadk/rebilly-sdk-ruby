# RebillySdk::File

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfFileId**](AllOfFileId.md) |  | [optional] 
**name** | **String** | Original File name. | [optional] 
**extension** | **String** | The File extension. | [optional] 
**description** | **String** | The File description. | [optional] 
**tags** | **Array&lt;String&gt;** | The tags list. | [optional] 
**mime** | **String** | The mime type. | [optional] 
**size** | **Integer** | The File size in bytes. | [optional] 
**width** | **Integer** | Image width, applicable to images only. | [optional] 
**height** | **Integer** | Image height, applicable to images only. | [optional] 
**sha1** | **String** | Hash sum of the file. | [optional] 
**created_time** | [**AllOfFileCreatedTime**](AllOfFileCreatedTime.md) | The upload date/time. | [optional] 
**updated_time** | [**AllOfFileUpdatedTime**](AllOfFileUpdatedTime.md) | The latest update date/time. | [optional] 
**is_public** | **BOOLEAN** | Is the file available publicly (without authentication). If true, the permalink in the _links section contains the public URL. | [optional] 
**_links** | [**Array&lt;AnyOfFileLinksItems&gt;**](.md) | The links related to resource. | [optional] 

