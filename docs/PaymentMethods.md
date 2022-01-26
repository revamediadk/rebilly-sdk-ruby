# RebillySdk::PaymentMethods

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**methods** | [**Array&lt;PaymentMethod&gt;**](PaymentMethod.md) | The list of available payment methods. Only payment methods with at least one active gateway account are allowed.  If not specified all available payment methods will be displayed.  Customer can choose any of those as well as the payment instrument for them. Additional steps will occur via a redirect to &#x60;approvalUrl&#x60;.  | [optional] 
**received_by** | **String** | Cash receiver&#x27;s name. Available only for &#x60;cash&#x60; payment method. | [optional] 
**reference** | **String** | Check reference data. Available only for &#x60;check&#x60; payment method. | [optional] 

