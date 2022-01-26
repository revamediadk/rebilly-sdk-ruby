# RebillySdk::CommonKycRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonKycRequestId**](AllOfCommonKycRequestId.md) |  | [optional] 
**documents** | [**Array&lt;CommonKycRequestDocuments&gt;**](CommonKycRequestDocuments.md) | Documents to be requested from customer. | 
**status** | **String** | Status of the request. | [optional] 
**redirect_url** | **String** | The URL to redirect the customer when an upload is completed. | [optional] 
**expiration_time** | **DateTime** | Expiration date/time. | [optional] 
**created_time** | [**AllOfCommonKycRequestCreatedTime**](AllOfCommonKycRequestCreatedTime.md) | Creation date/time. | [optional] 
**updated_time** | [**AllOfCommonKycRequestUpdatedTime**](AllOfCommonKycRequestUpdatedTime.md) | Latest update date/time. | [optional] 

