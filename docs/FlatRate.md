# RebillySdk::FlatRate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**formula** | **String** | The price formula determines what algorithm is used to calculate the invoice price based on a few factors, - the quantity in the order (which may be variable if usage pricing, otherwise determined when creating the order) - the price brackets data  To determine which formula is correct, please [see the price formula documentation](https://www.rebilly.com/docs/billing/pricing-formulas/).  | 
**price** | **Float** | Flat-rate pricing is represented in a simple price per unit. Some examples:  - $30 per unit - $0.10 per transaction - $50 per period  If the price is 0, it&#x27;s free.  | 
**max_quantity** | **Integer** | If the value is &#x60;null&#x60;, it&#x27;&#x27;s assumed to be infinite. | [optional] 

