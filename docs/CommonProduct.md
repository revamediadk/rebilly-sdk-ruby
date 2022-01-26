# RebillySdk::CommonProduct

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonProductId**](AllOfCommonProductId.md) | The product ID. | [optional] 
**name** | **String** | The product name. | 
**unit_label** | **String** | The unit label, such as per &#x60;seat&#x60; or per &#x60;unit&#x60;. | [optional] [default to &#x27;unit&#x27;]
**description** | **String** | The product description. | [optional] 
**requires_shipping** | **BOOLEAN** | If the product requires shipping, shipping calculations will be applied. | [optional] 
**options** | **Array&lt;String&gt;** | The product options such as color, size, etc. The product options definition does not include option values. Those are defined within the plans.  | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**created_time** | [**AllOfCommonProductCreatedTime**](AllOfCommonProductCreatedTime.md) | The product created time. | [optional] 
**updated_time** | [**AllOfCommonProductUpdatedTime**](AllOfCommonProductUpdatedTime.md) | The product updated time. | [optional] 

