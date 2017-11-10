# Vendors Resources

1. [Index](#vendors-index)
2. [Create](#vendors-create)
3. [Upsert](#vendors-upsert)

* * *

## Vendors Index
Returns a list of all Vendors.
<h2/>

### Endpoint
```
GET https://<your_host>.finario.com/api/vendors
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
`GET https://<your_host>.finario.com/api/vendors?token='your-api-token'`

<h2/>

### Response Status
`200`

<h2/>

### Response Body
```
[
  {
    name: '<name>',
    id: '<id>',
    vendor_id: '<external vendor id>',
    external_ids: [
      '<external vendor id>',
      '<external id 2>',
      '<external id n>'
    ]
  },
  ...
]
```

* * *

## Vendors Create

### Endpoint
`POST https://<your_host>.finario.com/api/vendors?token=your-api-token`
<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`name` | true | string |
`vendor_id` | | string | If available, this should be a unique ID from your external system. If not provided, a parameterized version of the vendor `name` will be created
`external_ids` | | array | If the same vendor has different IDs in different external systems, you can add more than one. Any of the values in this array would work as a Vendor ID for POST & PUT requests.
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

<h2/>

### Successful Response
#### Status
`201`

#### Body
```
{
  "id": "<id>",
  "name": "<vendor_name>",
  "vendor_id": "<vendor_id>",
  "external_ids": [
    "<vendor_id_1>",
    "<vendor_id_2>",
    "<vendor_id_n>"
  ]
}
```
<h2/>

### Errors
#### - Missing required field
_status_: `422`, _body_: `{"errors":{"name":["can't be blank"]}}`

#### - Duplicate vendor_id
_status_: `422`, _body_: `{"errors":{"short_name":["has already been taken"]}}`

* * *


## Vendors Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/vendors/<vendor_id>.json?token=your-api-token`

<h2/>

### Acceptable Parameters
Please see the [list in the Vendors Create section above](#acceptable-parameters).

<h2/>

### Successful Response

#### Status
`204`

#### Body
`null`

<h2/>

### Errors
#### - Missing required field
_status_: `422`, _body_: `{"errors":{"name":["can't be blank"]}}`

#### - Not found
This update endpoint works as an "upsert". If you use a `vendor_id` that doesn't exist, a new Vendor will be created with the `vendor_id` attribute set to the ID passed in.
