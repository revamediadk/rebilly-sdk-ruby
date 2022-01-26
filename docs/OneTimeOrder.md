# RebillySdk::OneTimeOrder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**revision** | **Integer** | The number of times the order data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation.  | [optional] 
**risk_metadata** | [****](.md) | Risk metadata. If null, the value would coalesce to the risk metadata captured when creating the payment token. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**created_time** | [****](.md) | Order created time. | [optional] 
**updated_time** | [****](.md) | Order updated time. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 
**status** | **String** | One-time order status. | [optional] 
**customer_id** | [****](.md) | The customer identifier string. | 

