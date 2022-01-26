# RebillySdk::SubscriptionReactivation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfSubscriptionReactivationId**](AllOfSubscriptionReactivationId.md) | Reactivation identifier. | [optional] 
**subscription_id** | [**AllOfSubscriptionReactivationSubscriptionId**](AllOfSubscriptionReactivationSubscriptionId.md) | Identifier of the reactivated subscription. | 
**cancellation_id** | [**AllOfSubscriptionReactivationCancellationId**](AllOfSubscriptionReactivationCancellationId.md) | Identifier of the related cancellation. | [optional] 
**description** | **String** | Reactivation reason description in free form. | [optional] 
**effective_time** | **DateTime** | The date from which the service period would start, unless the subscription is canceled but still active. In case the susbcription is still active, the subscription will continue the current service period. If omitted, it will default to the current time.  | [optional] 
**renewal_time** | **DateTime** | The time of the next subscription renewal. If omitted then it is computed from the effective time. If the subscription is canceled but active it is ignored, so the next renewal will happen as scheduled.  | [optional] 
**created_time** | **DateTime** | The time of resource creation (when it is posted). | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

