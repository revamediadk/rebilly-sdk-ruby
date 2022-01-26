# RebillySdk::KycDocument

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) |  | [optional] 
**file_id** | [****](.md) | Linked file object id. | [optional] 
**file_ids** | [**Array&lt;null&gt;**](.md) | Linked file object id&#x27;s. | [optional] 
**document_type** | [****](.md) | Document type submitted for validation, only identity-proof type is analyzed in an automated manner. | 
**document_subtype** | [****](.md) | Document subtype submitted for validation. | [optional] 
**status** | **String** | Status of the validation. | 
**rejection_reason** | [**KycDocumentRejection**](KycDocumentRejection.md) |  | [optional] 
**request_id** | [****](.md) | KYC request identifier string. | [optional] 
**created_time** | [****](.md) | Creation date/time. | [optional] 
**updated_time** | [****](.md) | Latest update date/time. | [optional] 
**processed_time** | [****](.md) | Processing date/time. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**customer_id** | [****](.md) | The customer ID. | 
**reviewer_id** | **String** | Reviewer&#x27;s user ID. | [optional] 
**reviewer_name** | **String** | Reviewer&#x27;s first and last name. | [optional] 
**review_start_time** | [****](.md) | Date and time that manual review starts. | [optional] 
**review_time** | [****](.md) | Date and time of manual review. | [optional] 
**notes** | **String** | Reviewer notes. | [optional] 
**tags** | [**Array&lt;Tag&gt;**](Tag.md) | A list of kyc document tags. | [optional] 
**reason** | **String** | Reason for uploading. | [optional] 
**match_level** | **Integer** | The level of strictness for the document matches. | [optional] 
**settings** | **Object** | The settings used to score the document. | [optional] 

