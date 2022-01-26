# RebillySdk::PayPalSettings

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**redirect_url** | **String** | The URL where the user will be redirected after authorizing the account on PayPal. | 
**enable_guest_checkout** | **BOOLEAN** | Allow users without PayPal accounts to pay using credit or debit cards. | [optional] [default to false]
**use_hosted_checkout_form** | **BOOLEAN** | Use Rebilly&#x27;s hosted PayPal form instead of redirecting customers to PayPal. | [optional] [default to false]
**force_guest_checkout** | **BOOLEAN** | Suppress PayPal payment method when Guest Checkout is available. Only applicable when useHostedCheckoutForm is enabled. | [optional] [default to false]

