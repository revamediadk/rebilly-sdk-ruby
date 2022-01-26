# RebillySdk::CustomerJWT

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCustomerJWTId**](AllOfCustomerJWTId.md) | The session identifier string. | [optional] 
**type** | **String** | Session type. | [optional] 
**token** | **String** | The session&#x27;s token used for authentication. | [optional] 
**invalidate** | **BOOLEAN** | Whether to invalidate token after exchange or not. | [optional] [default to true]
**one_time_password** | **String** | The one time password sent via an email. Should contain digits only. | [optional] 
**customer_id** | [**AllOfCustomerJWTCustomerId**](AllOfCustomerJWTCustomerId.md) | The customer&#x27;s ID. | [optional] 
**acl** | [**Acl**](Acl.md) |  | [optional] 
**custom_claims** | **Hash** |  | [optional] 
**created_time** | **DateTime** | Session created time. | [optional] 
**updated_time** | [**AllOfCustomerJWTUpdatedTime**](AllOfCustomerJWTUpdatedTime.md) | Session updated time. | [optional] 
**expired_time** | **DateTime** | Session expired time. Defaults to one hour. | [optional] 
**_links** | [**Array&lt;CustomerLink&gt;**](CustomerLink.md) | The links related to resource. | [optional] 

