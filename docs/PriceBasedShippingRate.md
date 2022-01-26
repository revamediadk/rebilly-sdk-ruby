# RebillySdk::PriceBasedShippingRate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The shipping rate name. | 
**min_order_subtotal** | **Float** | Minimum order subtotal for which this shipping rate is applicable, defaults to 0.00. | [optional] [default to 0]
**max_order_subtotal** | **Float** | Maximum order subtotal for which this shipping rate is applicable (NULL if no maximum). | [optional] 
**price** | **Float** | The shipping price - 0 is a valid value (for free). | 
**currency** | [**AllOfPriceBasedShippingRateCurrency**](AllOfPriceBasedShippingRateCurrency.md) |  | 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

