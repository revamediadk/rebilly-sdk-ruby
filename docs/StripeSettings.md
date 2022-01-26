# RebillySdk::StripeSettings

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**redirect_url** | **String** | The URL where the user will be redirected after authorizing the account on Stripe. | 
**disable_payment_intents** | **BOOLEAN** | If &#x60;true&#x60; the &#x60;Charges&#x60; API will be used instead of &#x60;PaymentIntents&#x60; API. | [optional] [default to false]
**enforce_off_session** | **BOOLEAN** | If &#x60;true&#x60;, &#x60;off_session&#x60; param will always be &#x60;true&#x60; in Stripe requests. | [optional] [default to false]
**copy_credentials_from** | **String** | The ID of an existing Stripe gateway account from which credentials will be copied in order to skip the onboarding process. | [optional] 

