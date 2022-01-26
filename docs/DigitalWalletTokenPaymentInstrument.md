# RebillySdk::DigitalWalletTokenPaymentInstrument

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | The digital wallet type. | 
**amount** | **Float** | Authorized for the digital wallet amount. | 
**currency** | [**AllOfDigitalWalletTokenPaymentInstrumentCurrency**](AllOfDigitalWalletTokenPaymentInstrumentCurrency.md) | Authorized for the digital wallet currency. | 
**descriptor** | **String** | The descriptor for a payment. | 
**bin** | **String** | Payment Card BIN (the PAN&#x27;s first 6 digits). | [optional] 
**last4** | **String** | Payment Card PAN&#x27;s last 4 digits. | [optional] 
**brand** | [**AllOfDigitalWalletTokenPaymentInstrumentBrand**](AllOfDigitalWalletTokenPaymentInstrumentBrand.md) |  | [optional] 
**exp_month** | **Integer** | Payment Card expiration month. | [optional] 
**exp_year** | **Integer** | Payment Card expiration year. | [optional] 
**payload** | **Object** | The digital wallet encoded data. May contain the digital wallet billing address. | 

