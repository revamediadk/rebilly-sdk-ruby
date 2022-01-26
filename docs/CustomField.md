# RebillySdk::CustomField

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the custom field. | [optional] 
**type** | **String** | Type value    | Description ------------- | ------------- array         | An array of strings up to 255 characters, maximum size is 1000 elements boolean       | true or false date          | String of format \&quot;full-date\&quot; (YYYY-MM-DD) from RFC-3339 (full-date) datetime      | String of format \&quot;date-time\&quot; (YYYY-MM-DDTHH:MM:SSZ) from RFC-3339 (date-time) integer       | Cardinal value of -2^31..2^31-1 number        | Float value. It can take cardinal values also which are interpreted as float string        | Regular string up to 255 characters monetary      | A map of 3-letters currency code and amount, e.g. {\&quot;currency\&quot;: \&quot;EUR\&quot;, \&quot;amount\&quot;: 25.30} The type cannot be changed.  | 
**description** | **String** | The custom field description. | [optional] 
**additional_schema** | [****](.md) | Additional parameters which can be added according to type: Parameter Name | Types         | Description -------------- | ------------- | ------------- allowedValues  | string, array | List of allowed values maxLength      | string        | Maximum allowed length for the string, 255 by default, up to 4000 The additional schema adds additional constrains for values.  | [optional] 
**_links** | [**Array&lt;SelfLink&gt;**](SelfLink.md) | The links related to resource. | [optional] 

