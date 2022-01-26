# RebillySdk::UpcomingInvoiceItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Type of line item. | 
**description** | **String** | Description of line item. | [optional] 
**unit_price_amount** | **Float** | Unit price of the line item. | 
**unit_price_currency** | [**AllOfUpcomingInvoiceItemUnitPriceCurrency**](AllOfUpcomingInvoiceItemUnitPriceCurrency.md) |  | 
**quantity** | **Integer** | Quantity of line item. | 
**period_start_time** | **DateTime** | Date-time when the period begins for this item. | [optional] 
**period_end_time** | **DateTime** | Date-time when the period ends for this item. | [optional] 
**created_time** | [**AllOfUpcomingInvoiceItemCreatedTime**](AllOfUpcomingInvoiceItemCreatedTime.md) | Date-time when the item was added to the subscription. | [optional] 

