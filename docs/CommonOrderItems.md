# RebillySdk::CommonOrderItems

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**plan_id** | [**AllOfCommonOrderItemsPlanId**](AllOfCommonOrderItemsPlanId.md) | The plan identifier string. | [optional] 
**quantity** | **Integer** | Number of units of the product on the given plan. | [optional] 
**plan** | [**OneOfCommonOrderItemsPlan**](OneOfCommonOrderItemsPlan.md) |  | 
**revision** | **Integer** | Increments with each override change to this specific item. | [optional] 
**is_modified** | **BOOLEAN** | Indicates if the plan information was modified for this subscription. | [optional] 
**is_grandfathered** | **BOOLEAN** | Indicates if the plan&#x27;s current revision is greater than this item&#x27;s plan revision. | [optional] 

