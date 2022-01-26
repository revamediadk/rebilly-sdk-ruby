# RebillySdk::IdentityMatches

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**contains_image** | **BOOLEAN** | Flag that indicates if there is an image that contains a face on it. | [optional] 
**is_identity_document** | **BOOLEAN** | Flag that indicates if this looks like and ID. | [optional] 
**is_published_online** | **BOOLEAN** | If there is an exact match found online. | [optional] 
**first_name** | **String** | The customer first name if it was matched, null otherwise. | [optional] 
**last_name** | **String** | The customer last name if it was matched, null otherwise. | [optional] 
**date_of_birth** | **DateTime** | The date of birth found on the document, null if not found. | [optional] 
**expiry_date** | **DateTime** | The expiry date found on the document, null if not found. | [optional] 
**issue_date** | **DateTime** | The issued date found on the document, null if not found. | [optional] 
**has_minimal_age** | **BOOLEAN** | Checks the minimal age, 21+ for USA and 18+ for all other countries. Null if dateOfBirth could not be determined. | [optional] 
**nationality** | **String** | The nationality found on the document, null otherwise. | [optional] 

