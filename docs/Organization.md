# RebillySdk::Organization

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**AllOfOrganizationId**](AllOfOrganizationId.md) | The organization identifier string. | [optional] 
**created_time** | [**AllOfOrganizationCreatedTime**](AllOfOrganizationCreatedTime.md) | The organization created time. | [optional] 
**updated_time** | [**AllOfOrganizationUpdatedTime**](AllOfOrganizationUpdatedTime.md) | The organization updated time. | [optional] 
**name** | **String** | The organization name. | 
**address** | **String** | The organization street address. | [optional] 
**address2** | **String** | The organization street address. | [optional] 
**city** | **String** | The organization city. | [optional] 
**region** | **String** | The organization region (state). | [optional] 
**country** | **String** | The organization country ISO Alpha-2 code. | 
**postal_code** | **String** | The organization postal code. | [optional] 
**phone_numbers** | [**ContactPhoneNumbers**](ContactPhoneNumbers.md) |  | [optional] 
**emails** | [**ContactEmails**](ContactEmails.md) |  | [optional] 
**tax_descriptor** | **String** | The organization&#x27;s tax label. This will be displayed on the invoice. | [optional] 
**invoice_time_zone** | **String** | Invoice will use this time zone to display time otherwise UTC will be used. Example \&quot;America/New_York\&quot;. | [optional] 
**is_primary** | **BOOLEAN** | True, if Organization is primary (available to set as true only, other organizations will become as isPrimary&#x3D;false). | [optional] 
**questionnaire** | [**OrganizationQuestionnaire**](OrganizationQuestionnaire.md) |  | [optional] 
**settings** | [**OrganizationSettings**](OrganizationSettings.md) |  | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

