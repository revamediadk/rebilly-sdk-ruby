# RebillySdk::CommonKycRequestDocuments

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**AllOfCommonKycRequestDocumentsType**](AllOfCommonKycRequestDocumentsType.md) | Document type to be requested from customer. | 
**subtypes** | [**Array&lt;KycDocumentSubtypes&gt;**](KycDocumentSubtypes.md) | Document subtype allowed for customer. | [optional] 
**max_attempts** | **Integer** | The number of document upload attempts. &#x60;0&#x60; treated as unlimited. | [optional] [default to 3]
**face_proof_required** | **BOOLEAN** | If &#x60;true&#x60; uploading matching face photo (selfie) is required. | [optional] 

