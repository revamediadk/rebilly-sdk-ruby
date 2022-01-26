# RebillySdk::ShippingZone

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfShippingZoneId**](AllOfShippingZoneId.md) | The shipping zone identifier string. | [optional] 
**name** | **String** | The shipping zone name. | 
**countries** | **Array&lt;String&gt;** | Countries covered by the shipping zone. A country can only belong to one shipping zone (no overlapping). This property can be empty or null to create a default shipping zone for countries that were not specified in other zones.  | [optional] 
**rates** | [**Array&lt;AllOfShippingZoneRatesItems&gt;**](.md) | Price-based shipping rate instructions. | [optional] 
**is_default** | [****](.md) | Is this Shipping Zone default. | [optional] 
**created_time** | [**AllOfShippingZoneCreatedTime**](AllOfShippingZoneCreatedTime.md) | The shipping zone created time. | [optional] 
**updated_time** | [**AllOfShippingZoneUpdatedTime**](AllOfShippingZoneUpdatedTime.md) | The shipping zone updated time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

