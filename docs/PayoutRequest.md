# RebillySdk::PayoutRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**website_id** | [****](.md) | The website identifier string. | 
**customer_id** | [****](.md) | The customer identifier string. | 
**currency** | [****](.md) |  | 
**amount** | **Float** | The transaction amount. | 
**invoice_ids** | [**Array&lt;ResourceId&gt;**](ResourceId.md) | The array of invoice identifiers. | [optional] 
**payment_instruction** | [****](.md) | Payment instruction. If not supplied, customer&#x27;s default payment instrument will be used. | [optional] 
**billing_address** | [****](.md) | Billing address. If not supplied, we use the billing address associated with the payment instrument, and then customer. | [optional] 
**request_id** | **String** | The request id is **recommended**. It prevents duplicate transaction requests within a short period of time. If a duplicate request is sent with the same &#x60;requestId&#x60; it will be ignored to prevent double-billing anyone.  It must be unique within a 24-hour period.  We recommend generating a UUID v4 as its value. | [optional] 
**gateway_account_id** | [****](.md) | Rebilly will select the appropriate payment gateway account for the transaction based on the properties of the transaction and the &#x60;gateway-account-requested&#x60; event rules configurations. If you wish to prevent Rebilly from making the gateway account selection, you may supply a gateway account id here, and it will be used instead. Only use this field if you intend to override the settings. | [optional] 
**description** | **String** | The payment description. | [optional] 
**notification_url** | **String** | The URL where a server-to-server notification request type &#x60;POST&#x60; with a transaction payload will be sent when the transaction&#x27;s result is finalized. Do not trust the notification; follow with a &#x60;GET&#x60; request to confirm the result of the transaction. Please respond with a &#x60;2xx&#x60; HTTP status code, or we will reattempt the request again. You may use &#x60;{id}&#x60; or &#x60;{result}&#x60; as placeholders in the URL and we will replace them with the transaction&#x27;s id and result accordingly.  | [optional] 
**redirect_url** | **String** | The URL to redirect the end-user when an offsite transaction is completed. Defaults to the website&#x27;s configured URL. You may use &#x60;{id}&#x60; or &#x60;{result}&#x60; as placeholders in the URL and we will replace them with the transaction&#x27;s id and result accordingly. | [optional] 
**custom_fields** | [**ResourceCustomFields**](ResourceCustomFields.md) |  | [optional] 
**risk_metadata** | [**RiskMetadata**](RiskMetadata.md) |  | [optional] 
**is_processed_outside** | **BOOLEAN** | True if transaction was processed outside Rebilly. | [optional] [default to false]
**is_merchant_initiated** | **BOOLEAN** | True if the transaction was initiated by the merchant. | [optional] [default to false]
**processed_time** | **DateTime** | The time the transaction was processed. Can be specified only if transaction was processed outside Rebilly. | [optional] 

