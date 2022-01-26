# RebillySdk::AllOfCommonPlanRecurringInterval

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**unit** | **String** | The unit of time. | 
**length** | **Integer** | The length of time. | 
**limit** | **Integer** | The number of invoices this subscription order will generate (if 1, it will not generate any beyond the initial order creation). For example, set this property to &#x60;12&#x60;, when the &#x60;periodUnit&#x60; is month and the &#x60;periodDuration&#x60; is 1, for a 1 year contract billed monthly.  | [optional] 
**billing_timing** | [**PlanBillingTiming**](PlanBillingTiming.md) |  | [optional] 

