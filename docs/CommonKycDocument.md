# RebillySdk::CommonKycDocument

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonKycDocumentId**](AllOfCommonKycDocumentId.md) |  | [optional] 
**file_id** | [**AllOfCommonKycDocumentFileId**](AllOfCommonKycDocumentFileId.md) | Linked file object id. | [optional] 
**file_ids** | [**Array&lt;AllOfCommonKycDocumentFileIdsItems&gt;**](.md) | Linked file object id&#x27;s. | [optional] 
**document_type** | [**AllOfCommonKycDocumentDocumentType**](AllOfCommonKycDocumentDocumentType.md) | Document type submitted for validation, only identity-proof type is analyzed in an automated manner. | 
**document_subtype** | [**AllOfCommonKycDocumentDocumentSubtype**](AllOfCommonKycDocumentDocumentSubtype.md) | Document subtype submitted for validation. | [optional] 
**status** | **String** | Status of the validation. | 
**rejection_reason** | [**KycDocumentRejection**](KycDocumentRejection.md) |  | [optional] 
**request_id** | [**AllOfCommonKycDocumentRequestId**](AllOfCommonKycDocumentRequestId.md) | KYC request identifier string. | [optional] 
**created_time** | [**AllOfCommonKycDocumentCreatedTime**](AllOfCommonKycDocumentCreatedTime.md) | Creation date/time. | [optional] 
**updated_time** | [**AllOfCommonKycDocumentUpdatedTime**](AllOfCommonKycDocumentUpdatedTime.md) | Latest update date/time. | [optional] 
**processed_time** | [**AllOfCommonKycDocumentProcessedTime**](AllOfCommonKycDocumentProcessedTime.md) | Processing date/time. | [optional] 
**_links** | [**Array&lt;AnyOfCommonKycDocumentLinksItems&gt;**](.md) | The links related to resource. | [optional] 

