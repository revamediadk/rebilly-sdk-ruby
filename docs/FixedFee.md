# RebillySdk::FixedFee

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**formula** | **String** | The price formula determines what algorithm is used to calculate the invoice price based on a few factors, - the quantity in the order (which may be variable if usage pricing, otherwise determined when creating the order) - the price brackets data  To determine which formula is correct, please [see the price formula documentation](https://www.rebilly.com/docs/billing/pricing-formulas/).  | 
**price** | **Float** | For the very simple price when it&#x27;s fixed and does not depend on the quantity chosen by customer.  If the price is 0, it&#x27;s free.  | 

