# RebillySdk::CommonOrderPreview

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**website_id** | [**AllOfCommonOrderPreviewWebsiteId**](AllOfCommonOrderPreviewWebsiteId.md) | The website identifier string. | 
**items** | [**Array&lt;CommonOrderPreviewItems&gt;**](CommonOrderPreviewItems.md) |  | 
**billing_address** | [**AllOfCommonOrderPreviewBillingAddress**](AllOfCommonOrderPreviewBillingAddress.md) | The billing address. | [optional] 
**delivery_address** | [**AllOfCommonOrderPreviewDeliveryAddress**](AllOfCommonOrderPreviewDeliveryAddress.md) | The delivery address. | [optional] 
**coupon_ids** | **Array&lt;String&gt;** | The list of coupons applied to the order. | [optional] 
**currency** | [**AllOfCommonOrderPreviewCurrency**](AllOfCommonOrderPreviewCurrency.md) |  | [optional] 
**line_items** | [**Array&lt;CommonOrderPreviewLineItems&gt;**](CommonOrderPreviewLineItems.md) | Purchase items array. | [optional] 
**taxes** | [**Array&lt;CommonOrderPreviewTaxes&gt;**](CommonOrderPreviewTaxes.md) | Taxes applied to this purchase. | [optional] 
**discounts** | [**Array&lt;CommonOrderPreviewDiscounts&gt;**](CommonOrderPreviewDiscounts.md) | Discounts applied to this purchase. | [optional] 
**subtotal_amount** | **Float** | The purchase&#x27;s subtotal amount. | [optional] 
**tax_amount** | **Float** | The purchase&#x27;s taxes amount. | [optional] 
**shipping_amount** | **Float** | The purchase&#x27;s shipping amount. This property **will likely change** to support multiple shipping methods. | [optional] 
**discounts_amount** | **Float** | The purchase&#x27;s discounts amount. | [optional] 
**total** | **Float** | The purchase&#x27;s total amount. | [optional] 

