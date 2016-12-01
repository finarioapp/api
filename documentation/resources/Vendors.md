# Vendors Resources

1. [Index](#vendors-index)
2. [Create](#vendors-create)
3. [Upsert](#vendors-upsert)

* * *

## Vendors Index
Returns a list of all Vendors.
<hr style="border-bottom: 1px solid #ddd"/>

### Endpoint
```
GET https://<your_host>.finario.com/api/vendors
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
`GET https://<your_host>.finario.com/api/vendors?token='your-api-token'`

<hr style="border-bottom: 1px solid #ddd"/>

### Response Status
`200`

<hr style="border-bottom: 1px solid #ddd"/>

### Response Body
```
[
  {
    name: '<name>',
    id: '<id>',
    vendor_id: '<external vendor id>'
  },
  ...
]
```

* * *

## Vendors Create

### Endpoint
`POST https://<your_host>.finario.com/api/vendors?token=your-api-token`
<hr style="border-bottom: 1px solid #ddd"/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`name` | true | string |
`vendor_id` | | string | If available, this should be a unique ID from your external system. If not provided, a parameterized version of the vendor `name` will be created
`phone_number` | | string |
`web_address` | | string |
`address` | | string |
`city` | | string |
`state` | | string |
`postal_code` | | string |
`country_code` | | string |
`contact_name` | | string |
`contact_email` | | string |
`notes` | | string |

<hr style="border-bottom: 1px solid #ddd"/>

### Successful Response
#### Status
`201`

#### Body
```
{
  "id": "<id>",
  "name": "<vendor_name>",
  "vendor_id": "<vendor_id>"
}
```
<hr style="border-bottom: 1px solid #ddd"/>

### Errors
#### - Missing required field
_status_: `422`, _body_: `{"errors":{"name":["can't be blank"]}}`

#### - Duplicate vendor_id
_status_: `422`, _body_: `{"errors":{"short_name":["has already been taken"]}}`

* * *


## Vendors Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/vendors/<vendor_id>.json?token=your-api-token`

<hr style="border-bottom: 1px solid #ddd"/>

### Acceptable Parameters
Please see the [list in the Vendors Create section above](#acceptable-parameters).

<hr style="border-bottom: 1px solid #ddd"/>

### Successful Response

#### Status
`204`

#### Body
`null`

<hr style="border-bottom: 1px solid #ddd"/>

### Errors
#### - Missing required field
_status_: `422`, _body_: `{"errors":{"name":["can't be blank"]}}`

#### - Not found
__PLEASE NOTE__: This update endpoint works as an "upsert". If you use a Vendor ID that doesn't exist, a new vendor will be created.
