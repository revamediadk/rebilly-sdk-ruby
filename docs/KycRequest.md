# RebillySdk::KycRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) |  | [optional] 
**documents** | [**Array&lt;CommonKycRequestDocuments&gt;**](CommonKycRequestDocuments.md) | Documents to be requested from customer. | 
**status** | **String** | Status of the request. | [optional] 
**redirect_url** | **String** | The URL to redirect the customer when an upload is completed. | [optional] 
**expiration_time** | **DateTime** | Expiration date/time. | [optional] 
**created_time** | [****](.md) | Creation date/time. | [optional] 
**updated_time** | [****](.md) | Latest update date/time. | [optional] 
**customer_id** | [****](.md) | The customer ID. | 
**reason** | **String** | Reason for uploading. | [optional] 
**match_level** | **Integer** | The level of strictness for the document matches. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 

