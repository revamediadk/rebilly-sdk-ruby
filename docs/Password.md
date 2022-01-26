# RebillySdk::Password

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**expired_time** | **DateTime** | Token&#x27;s expired time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 
**token** | **String** | The token identifier string. | [optional] 
**mode** | **String** | The token&#x27;s generation mode. | [optional] [default to &#x27;password&#x27;]
**otp_required** | **BOOLEAN** | Should OTP be required to exchange this token. | [optional] 
**credential_id** | [****](.md) | The credential&#x27;s ID. | [optional] 
**username** | **String** | The token&#x27;s username. | 
**password** | **String** | The token&#x27;s password. | 
**customer_id** | [****](.md) | The token&#x27;s customer ID. | [optional] 

