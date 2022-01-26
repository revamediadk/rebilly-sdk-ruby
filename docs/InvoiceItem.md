# RebillySdk::InvoiceItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfInvoiceItemId**](AllOfInvoiceItemId.md) | The website identifier string. | [optional] 
**type** | **String** | Invoice item&#x27;s type. | 
**description** | **String** | Invoice item&#x27;s description. | [optional] 
**unit_price** | **Float** | Invoice item&#x27;s price. | 
**quantity** | **Integer** | Invoice item&#x27;s quantity. | [optional] 
**price** | **Float** | Invoice item&#x27;s total price. | [optional] 
**product_id** | [**AllOfInvoiceItemProductId**](AllOfInvoiceItemProductId.md) | The product&#x27;s ID. | [optional] 
**discount_amount** | **Float** | Invoice item discount amount. | [optional] 
**period_start_time** | **DateTime** | Start time. | [optional] 
**period_end_time** | **DateTime** | End time. | [optional] 
**period_number** | **Integer** | Invoice item subscription order period number. | [optional] 
**created_time** | [**AllOfInvoiceItemCreatedTime**](AllOfInvoiceItemCreatedTime.md) | Invoice item created time. | [optional] 
**updated_time** | [**AllOfInvoiceItemUpdatedTime**](AllOfInvoiceItemUpdatedTime.md) | Invoice item updated time. | [optional] 
**tax** | [**AllOfInvoiceItemTax**](AllOfInvoiceItemTax.md) | Invoice item tax. | [optional] 
**_links** | [**Array&lt;AnyOfInvoiceItemLinksItems&gt;**](.md) | The links related to resource. | [optional] 
**_embedded** | [**Array&lt;AnyOfInvoiceItemEmbeddedItems&gt;**](.md) | Any embedded objects available that are requested by the &#x60;expand&#x60; querystring parameter. | [optional] 

