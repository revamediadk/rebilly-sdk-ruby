# RebillySdk::CommonPlan

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCommonPlanId**](AllOfCommonPlanId.md) | The plan ID. | [optional] 
**name** | **String** | The plan name, displayed on invoices and receipts. | 
**product_id** | [**AllOfCommonPlanProductId**](AllOfCommonPlanProductId.md) | The related product ID. | 
**product_options** | **Hash&lt;String, String&gt;** | Name-value pairs to specify the product options. | [optional] 
**currency** | [**AllOfCommonPlanCurrency**](AllOfCommonPlanCurrency.md) |  | 
**currency_sign** | **String** | Currency sign. | [optional] 
**pricing** | [**PlanPriceFormula**](PlanPriceFormula.md) |  | 
**recurring_interval** | [**AllOfCommonPlanRecurringInterval**](AllOfCommonPlanRecurringInterval.md) | The service interval. For a one-time item, use &#x60;null&#x60;. | [optional] 
**trial** | [**CommonPlanTrial**](CommonPlanTrial.md) |  | [optional] 
**is_trial_only** | **BOOLEAN** | Whether a plan has a trial without recurring instructions. | [optional] 
**setup** | [**CommonPlanSetup**](CommonPlanSetup.md) |  | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**revision** | **Integer** | Increments when the plan is modified.  Compare to materialized subscription items revision.  | [optional] 
**created_time** | [**AllOfCommonPlanCreatedTime**](AllOfCommonPlanCreatedTime.md) | Plan created time. | [optional] 
**updated_time** | [**AllOfCommonPlanUpdatedTime**](AllOfCommonPlanUpdatedTime.md) | Plan updated time. | [optional] 

