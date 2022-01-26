# RebillySdk::TransactionBumpOffer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**order** | [**AllOfTransactionBumpOfferOrder**](AllOfTransactionBumpOfferOrder.md) | Initial amount and currency. | [optional] 
**version** | [**AllOfTransactionBumpOfferVersion**](AllOfTransactionBumpOfferVersion.md) | The name of the version that was picked (useful for measuring split tests). | [optional] 
**language** | [**AllOfTransactionBumpOfferLanguage**](AllOfTransactionBumpOfferLanguage.md) | The language of the bump offer that was displayed to user (useful for finding any translation problems). | [optional] 
**outcome** | [**PurchaseBumpStatus**](PurchaseBumpStatus.md) |  | [optional] 
**presented_offers** | [**AllOfTransactionBumpOfferPresentedOffers**](AllOfTransactionBumpOfferPresentedOffers.md) | Offers presented to a customer. | [optional] 
**selected_offer** | [**AllOfTransactionBumpOfferSelectedOffer**](AllOfTransactionBumpOfferSelectedOffer.md) | Offer selected by a customer. Null if bump offer outcome is not &#x60;selected&#x60;. | [optional] 

