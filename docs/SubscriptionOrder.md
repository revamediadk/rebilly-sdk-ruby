# RebillySdk::SubscriptionOrder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**canceled_time** | [****](.md) | Subscription order canceled time. | [optional] 
**canceled_by** | **String** | Canceled by. | [optional] 
**cancel_category** | **String** | Cancel category. | [optional] 
**cancel_description** | **String** | Cancel reason description in free form. | [optional] 
**revision** | **Integer** | The number of times the order data has been modified. The revision is useful when analyzing webhook data to determine if the change takes precedence over the current representation.  | [optional] 
**risk_metadata** | [****](.md) | Risk metadata. If null, the value would coalesce to the risk metadata captured when creating the payment token. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**created_time** | [****](.md) | Order created time. | [optional] 
**updated_time** | [****](.md) | Order updated time. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;null&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 
**status** | **String** | The status of the subscription service. A subscription starts in the &#x60;pending&#x60; status, and will become &#x60;active&#x60; when the service period begins.  | [optional] 
**in_trial** | **BOOLEAN** | True if the subscription is currently in a trial period. | [optional] 
**trial** | [**CommonSubscriptionOrderTrial**](CommonSubscriptionOrderTrial.md) |  | [optional] 
**is_trial_only** | **BOOLEAN** | Whether a subscription ends after a trial period. Recurring settings are ignored if it&#x27;s &#x60;true&#x60;. | [optional] [default to false]
**invoice_time_shift** | [****](.md) | You can shift issue time and due time of invoices for this subscription. This setting overrides plan settings. To use plan settings, set &#x60;null&#x60;. To use multiple plans in one subscription they all must have the same billing period, this property allows to subscribe to different plans.  | [optional] 
**recurring_interval** | [**CommonSubscriptionOrderRecurringInterval**](CommonSubscriptionOrderRecurringInterval.md) |  | [optional] 
**autopay** | **BOOLEAN** | Autopay determines if a payment attempt will be automatic. | [optional] [default to true]
**start_time** | **DateTime** | Subscription start time.  When the value is sent as null, it will use the current time. This value can&#x27;t be in past more than one service period. | [optional] 
**end_time** | [****](.md) | Subscription end time. | [optional] 
**renewal_time** | **DateTime** | Subscription renewal time. | [optional] 
**rebill_number** | **Integer** | The current period number. | [optional] 
**line_items** | [****](.md) | Subscription line items which queue until the next renewal (or interim) invoice is issued for the subscription. | [optional] 
**line_item_subtotal** | [**CommonSubscriptionOrderLineItemSubtotal**](CommonSubscriptionOrderLineItemSubtotal.md) |  | [optional] 
**customer_id** | [****](.md) | The customer identifier string. | 
**renewal_reminder_time** | [****](.md) | Time renewal reminder event will be triggered. | [optional] 
**renewal_reminder_number** | **Integer** | Number of renewal reminder events triggered. | [optional] 
**trial_reminder_time** | [****](.md) | Time renewal reminder event will be triggered. | [optional] 
**trial_reminder_number** | **Integer** | Number of renewal reminder events triggered. | [optional] 

