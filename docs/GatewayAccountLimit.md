# RebillySdk::GatewayAccountLimit

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfGatewayAccountLimitId**](AllOfGatewayAccountLimitId.md) | The gateway account limit identifier. | [optional] 
**status** | **String** | The gateway account limit status. | [optional] 
**start_time** | **DateTime** | The limit&#x27;s current period start time. | [optional] 
**end_time** | **DateTime** | The limit&#x27;s current period end time. At this time, the limit will reset. | [optional] 
**frequency** | **String** | The limit&#x27;s period will reset according to the frequency. | [optional] 
**type** | **String** | The limit can be on &#x60;money&#x60; or &#x60;count&#x60; of transactions. If &#x60;money&#x60; is chosen, the currency is the report currency.  | [optional] 
**cap** | **Integer** | The limit&#x27;s value cap is the maximum desired value. If type is money, the currency is the report currency. The cap only applies to approved transactions of type &#x60;authorize&#x60; or &#x60;sale&#x60;.  | 
**usage** | **Integer** | The limit&#x27;s actual usage during this period. | [optional] 
**created_time** | [**AllOfGatewayAccountLimitCreatedTime**](AllOfGatewayAccountLimitCreatedTime.md) | Gateway account limit created time. | [optional] 
**updated_time** | [**AllOfGatewayAccountLimitUpdatedTime**](AllOfGatewayAccountLimitUpdatedTime.md) | Gateway account limit updated time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

