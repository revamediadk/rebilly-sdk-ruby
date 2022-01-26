# RebillySdk::FlexiblePlan

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfFlexiblePlanId**](AllOfFlexiblePlanId.md) | The ID of plan to modify with given settings. | 
**name** | **String** | The plan name, displayed on invoices and receipts. | 
**product_id** | [****](.md) | The related product ID. | 
**product_options** | **Hash&lt;String, String&gt;** | Name-value pairs to specify the product options. | [optional] 
**currency** | [****](.md) |  | 
**currency_sign** | **String** | Currency sign. | [optional] 
**pricing** | [**PlanPriceFormula**](PlanPriceFormula.md) |  | 
**recurring_interval** | [****](.md) | The service interval. For a one-time item, use &#x60;null&#x60;. | [optional] 
**trial** | [**CommonPlanTrial**](CommonPlanTrial.md) |  | [optional] 
**is_trial_only** | **BOOLEAN** | Whether a plan has a trial without recurring instructions. | [optional] 
**setup** | [**CommonPlanSetup**](CommonPlanSetup.md) |  | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**revision** | **Integer** | Increments when the plan is modified.  Compare to materialized subscription items revision.  | [optional] 
**created_time** | [****](.md) | Plan created time. | [optional] 
**updated_time** | [****](.md) | Plan updated time. | [optional] 

