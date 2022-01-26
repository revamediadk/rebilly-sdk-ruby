# RebillySdk::Coupon

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfCouponId**](AllOfCouponId.md) | Coupon&#x27;s ID a.k.a redemption code. | [optional] 
**discount** | [**Discount**](Discount.md) |  | 
**restrictions** | [**Array&lt;CouponRestriction&gt;**](CouponRestriction.md) | Coupon restrictions. | [optional] 
**redemptions_count** | **Integer** | Coupon&#x27;s redemptions count. | [optional] 
**status** | **String** | If coupon enabled. | [optional] 
**description** | **String** | Your coupon description. When it is not empty this is used for invoice discount item description, otherwise the item&#x27;s description uses coupon&#x27;s ID like &#x27;Coupon \&quot;COUPON-ID\&quot;&#x27;.  | [optional] 
**issued_time** | **DateTime** | Coupon&#x27;s issued time (start time). | 
**expired_time** | **DateTime** | Coupon&#x27;s expire time (end time). | [optional] 
**created_time** | [**AllOfCouponCreatedTime**](AllOfCouponCreatedTime.md) | Coupon created time. | [optional] 
**updated_time** | [**AllOfCouponUpdatedTime**](AllOfCouponUpdatedTime.md) | Coupon updated time. | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

