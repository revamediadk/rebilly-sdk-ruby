# RebillySdk::NuaPay

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The gateway identifier string. | [optional] 
**gateway_name** | [**GatewayName**](GatewayName.md) |  | 
**acquirer_name** | [****](.md) |  | [optional] 
**method** | [**PaymentMethod**](PaymentMethod.md) |  | 
**accepted_currencies** | **Array&lt;String&gt;** | Accepted currencies (array of the currency three letter codes). | 
**payment_card_schemes** | [**Array&lt;PaymentCardBrand&gt;**](PaymentCardBrand.md) | Accepted payment card brands. | [optional] 
**status** | **String** | The gateway account&#x27;s status. | [optional] 
**merchant_category_code** | **String** | The gateway account&#x27;s merchant category code. | [optional] [default to &#x27;0000&#x27;]
**dcc_markup** | **Integer** | Dynamic currency conversion markup in basis points. | [optional] 
**dcc_force_currency** | **String** | Force dynamic currency conversion to the specified currency on each sale. Leave it empty to disable force DCC.  | [optional] 
**descriptor** | **String** | The gateway account&#x27;s descriptor. | [optional] 
**city_field** | **String** | The gateway account&#x27;s city field (also known as line 2 descriptor). | [optional] 
**excluded_dcc_quote_currencies** | **Array&lt;String&gt;** | Excluded Dynamic Currency Conversion Quote Currencies. | [optional] 
**monthly_limit** | **Float** | Monthly Limit. | [optional] 
**approval_window_ttl** | **Integer** | The time window (in seconds) allotted for approving an offsite transaction before it is automatically &#x60;abandoned&#x60;. | [optional] [default to 3600]
**reconciliation_window_enabled** | **BOOLEAN** | If a transaction is not reconciled within the &#x60;reconciliationWindowTtl&#x60; time, then the transaction is marked as &#x60;abandoned&#x60;. | [optional] [default to false]
**reconciliation_window_ttl** | **Integer** | The time window (in seconds) allotted for a reconciliation to occur. If it is not reconciled in that time, then the transaction is marked as &#x60;abandoned&#x60;. | [optional] 
**three_d_secure** | **BOOLEAN** | True, if Gateway Account allows 3DSecure. | [optional] [default to false]
**dynamic_descriptor** | **BOOLEAN** | True, if Gateway Account allows dynamic descriptor. | [optional] [default to false]
**digital_wallets** | [**DigitalWallets**](DigitalWallets.md) |  | [optional] 
**is_down** | **BOOLEAN** | True if gateway is currently in downtime period. | [optional] 
**additional_filters** | **String** | The additional filters are used to determine whether the gateway account can be selected for the transaction to be processed. For example, the filter may put a maximum amount value. If the transaction is above that amount, this gateway account wouldn&#x27;t be used. This follows our standard filter format.  | [optional] 
**timeout** | **Integer** | Gateway Account request timeout in seconds. | [optional] 
**token** | **String** | Gateway Account token. | [optional] 
**sticky** | **BOOLEAN** | Customer&#x27;s payment instrument will \&quot;stick\&quot; to the gateway account for future transactions when enabled. | [optional] [default to true]
**setup_instruction** | **String** | Creates zero, one, or more child transactions such as &#x60;authorize&#x60; and &#x60;void&#x60;. The transactions are linked to the &#x60;setup&#x60; transaction by the &#x60;parentTransactionId&#x60; relationship.  | [optional] [default to &#x27;do-nothing&#x27;]
**created_time** | [****](.md) | Gateway Account created time. | [optional] 
**updated_time** | [****](.md) | Gateway Account updated time. | [optional] 
**organization_id** | [****](.md) | Organization ID. | [optional] 
**_links** | [**Array&lt;null&gt;**](.md) | The links related to resource. | [optional] 
**credentials** | [**NuaPayCredentials**](NuaPayCredentials.md) |  | 

