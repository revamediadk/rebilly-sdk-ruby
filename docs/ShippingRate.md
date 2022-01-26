# RebillySdk::ShippingRate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The shipping rate identifier string. | [optional] 
**name** | **String** | The shipping rate name. | 
**descriptions** | **String** | The shipping rate description. | [optional] 
**price** | **Float** | The shipping rate price - 0 is a valid value (for free). | 
**currency** | [****](.md) |  | 
**filter** | **String** | A filter based on the invoice&#x27;s properties which is used to determine when the rate is applicable. Empty filter will match any case. | [optional] 
**status** | **String** | If &#x60;inactive&#x60;, the shipping rate will not be matched in any case. | [optional] [default to &#x27;active&#x27;]
**created_time** | [****](.md) | The shipping rate created time. | [optional] 
**updated_time** | [****](.md) | The shipping rate updated time. | [optional] 

