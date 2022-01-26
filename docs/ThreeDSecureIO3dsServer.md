# RebillySdk::ThreeDSecureIO3dsServer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | 
**merchant_id** | **String** | Merchant Id. | 
**merchant_name** | **String** | Merchant Name. | 
**merchant_acquirer_bin_visa** | **String** | Visa Acquirer BIN. | 
**merchant_acquirer_bin_mastercard** | **String** | Mastercard Acquirer BIN. | 
**merchant_country** | **String** | Merchant Country ISO Alpha-2 Code. | 
**merchant_url** | **String** | Merchant URL. | 
**v1** | **BOOLEAN** | Value determines if requests can use version 1 of 3DS. In case both v1 and v2 are enabled it will prefer v2. If v2 is not supported for the issuer, it will coalesce to v1.  | [optional] 
**v2** | **BOOLEAN** | Value determines if requests will attempt version 2 of 3DS. In case both v1 and v2 are enabled it will prefer v2. If v2 is not supported for the issuer, it will coalesce to v1.  | [optional] 
**transaction_type** | **String** | 01 - Goods/Service Purchase 03 - Check Acceptance 10 - Account Funding 11 - Quasi-Cash Transaction 28 - Prepaid Activation and Load  Identifies the type of transaction being authenticated.  | [optional] 
**use3ds_for_merchant_initiated** | **BOOLEAN** | Use 3DS for merchant initiated transactions. | [optional] [default to false]
**three_ri_ind** | **String** | 01 - Recurring transaction 02 - Instalment transaction 03 - Add card 04 - Maintain card information 05 - Account verification 06 - Split/delayed shipment 07 - Top-up 08 - Mail Order 09 - Telephone Order 10 - Whitelist status check 11 - Other payment  Indicates the type of 3RI request. Values 06 - 11 are only supported in 3D2 2.2.0.  | [optional] 

