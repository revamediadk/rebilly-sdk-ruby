# RebillySdk::AML

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **String** | First Name. | [optional] 
**last_name** | **String** | Last Name. &#x60;null&#x60; if it is a single-name entity. | [optional] 
**source** | **String** | Which list this came from. | [optional] 
**source_type** | **String** | The list type. | [optional] 
**gender** | **String** | Gender of returned identity (if &#x60;type&#x60; is &#x60;individual&#x60;). | [optional] 
**title** | **Array&lt;String&gt;** | The title of their position. | [optional] 
**type** | **String** | The record type. | [optional] 
**legal_basis** | **Array&lt;String&gt;** | List of references to legal documents if they exist. | [optional] 
**regime** | **String** | Regime. | [optional] 
**confidence** | **String** | The source list&#x27;s confidence in information. | [optional] 
**nationality** | **String** | The nationality of the identity. | [optional] 
**address** | [**Array&lt;AMLAddress&gt;**](AMLAddress.md) | Addresses related to the identity. | [optional] 
**dob** | **Array&lt;Date&gt;** | One or more possible dates of birth. | [optional] 
**aliases** | [**Array&lt;AMLAliases&gt;**](AMLAliases.md) | List of aliases, if any. | [optional] 
**passport** | [**Array&lt;AMLPassport&gt;**](AMLPassport.md) | Passport information. | [optional] 
**comments** | **String** | Extra information (the content varies per list). | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource, including links provided by the list. | [optional] 

