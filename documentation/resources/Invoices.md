# Invoices Resources

1. [Show](#invoices-show)
2. [Create](#invoices-create)
3. [Upsert](#invoices-upsert)

* * *

## Invoices Show

### Endpoint
```
GET https://<your_host>.finario.com/api/invoices/<invoice_id>
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/invoices/<invoice_id>?token=<your_api_token>
```
<h2/>


### Successful Response
#### Status
`200`

#### Body
```
{
  "amount": {
    "cents": 1000,
    "currency": "USD"
  },
  "assignment": {
    "organization_id": "<org_id>",
    "user_id": "<user_id>",
    "investment_id": "<investment_id>",
    "cost_id": "<cost_id>",
    "manually_unassigned": false
  },
  "date": "2016-11-30T00:00:00-05:00",
  "id": "<invoice_id>",
  "vendor_id": "<vendor_id>"
}
```

<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{"success":false,"message":"Invoice Not Found"}`

* * *

## Invoices Create

### Endpoint
`POST https://<your_host>.finario.com/api/investments/<investment_id>/vendors/<vendor_id>/invoices?token=<your_api_token>`
<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`amount` | true | float |
`date` | true | time | e.g., "2016-11-30"
`number` | true | string |
`reference` | true | string | A unique external reference ID
`currency_iso_code` | | string | e.g., "USD" or "EUR". If no currency is given, your account's base currency will be used.
`description` | | string |
`po_number` | | string | Purchase order number
`po_line` | | string | Purchase order line
`po_type` | | string | Purchase order type
`gl_line` | | string | General ledger line

<h2/>

### Successful Response
#### Status
`201`

#### Body
```
{
  "amount": {
    "cents": 1000,
    "currency": "USD"
  },
  "assignment": {
    "organization_id": "<org_id>",
    "user_id": "<user_id>",
    "investment_id": "<investment_id>",
    "cost_id": "<cost_id>",
    "manually_unassigned": false
  },
  "date": "2016-11-30T00:00:00-05:00",
  "id": "<invoice_id>",
  "number": "<invoice_number>",
  "reference": "<invoice_reference_id>",
  "vendor_id": "<vendor_id>"
}
```

<h2/>

### Errors
#### - Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### - Vendor not found
_status_: `404`, _body_: `{"success":false,"message":"Vendor Not Found"}`

#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"],"number":["can't be blank"]}}`

#### - Duplicate Reference ID
_status_: `422`, _body_: `{"errors":{"reference":["has already been taken"]}}`


* * *


## Invoices Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/investments/<investment_id>/vendors/<vendor_id>/invoices/<invoice_id>`

or

`PUT https://<your_host>.finario.com/api/investments/<investment_id>/vendors/<vendor_id>/invoices/<invoice_reference>`


<h2/>

### Acceptable Parameters
Please see the [list in the Invoices Create section above](#acceptable-parameters).

<h2/>

### Successful Response

#### Status
`204`

#### Body
`null`

<h2/>

### Errors
#### - Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### - Vendor not found
_status_: `404`, _body_: `{"success":false,"message":"Vendor Not Found"}`

#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"],"number":["can't be blank"]}}`

#### - Invoice not found
This update endpoint works as an "upsert". If you use an Invoice Reference ID that doesn't exist, a new invoice will be created with the `reference` attribute set to the ID passed in.
