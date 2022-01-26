# RebillySdk::ReadyToPayPaymentCardMethod

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | **String** | The payment method. | 
**feature** | **OneOfReadyToPayPaymentCardMethodFeature** | The specific feature (for example, digital wallet or a processor) of this method. If method doesn&#x27;t have any features - will be null.  | [optional] 
**brands** | [**Array&lt;PaymentCardBrand&gt;**](PaymentCardBrand.md) | The list of supported brands. | [optional] 
**filters** | [**ReadyToPayMethodFilters**](ReadyToPayMethodFilters.md) |  | [optional] 

