# RebillySdk::PercentageFormula

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** |  | 
**currency** | [**CurrencyCode**](CurrencyCode.md) |  | 
**bips** | [**Bips**](Bips.md) |  | 
**round** | **String** | A mode how the rounding should work: floor, ceiling, or regular rounding: - \&quot;up\&quot; (ceiling) example: $0.011 becomes $0.02, $0.019 becomes $0.02; - \&quot;down\&quot; (floor) example: $0.011 becomes $0.01, $0.019 becomes $0.01; - \&quot;regular\&quot; example: $0.011 becomes $0.01, $0.019 becomes $0.02, $0.015 becomes 0.02 too; Defaults to \&quot;regular\&quot;.  | [optional] [default to &#x27;regular&#x27;]
**min_amount** | **Float** | The amount applied, in case the calculated fee is less than the required minimum.  | [optional] 

