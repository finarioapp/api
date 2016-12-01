# Organizations Resources

1. [Index](#organizations-index)
2. [Create](#organizations-create)

* * *

## Organizations Index
Returns a list of all Organizations.
<h2/>

### Endpoint
```
GET https://<your_host>.finario.com/api/organizations
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
`GET https://<your_host>.finario.com/api/organizations?token='your-api-token'`

<h2/>

### Response Status
`200`

<h2/>

### Response Body
* Please note that a list of objects is returned separated by a new line. An array is not returned
```
{"name": "<org_1_name>", "id":"<org_1_id>", "parent_id":"<org_1_parent_id"}
{"name": "<org_2_name>", "id":"<org_2_id>", "parent_id":"<org_2_parent_id"}
...
{"name": "<org_n_name>", "id":"<org_n_id>", "parent_id":"<org_n_parent_id"}
```

* * *

## Organizations Create

### Endpoint
`POST https://<your_host>.finario.com/api/<parent_org_id>/organizations?token=your-api-token`
* Please note that a `<parent_org_id>` is required in the URL. A top-level organization cannot be created through the API.

<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`name` | true | string |
`org_code` | true | string |
`default_currency_code` | | string | ISO code. e.g., 'USD' or 'EUR'

<h2/>

### Successful Response
#### Status
`201`

#### Body
`{id: "<new organization id>"}`

<h2/>

### Errors
#### - Parent org not found
_status_: `404`, _body_: `{"errors":["Not Found"]}`

#### - Missing required fields
_status_: `406`, _body_: `{"errors":{"name":["can't be blank"],"org_code":["can't be blank"]}}`

