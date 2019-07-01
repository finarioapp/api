# Invoices Resources

1. [Index](#invoices-index)
2. [Show](#invoices-show)
3. [Create](#invoices-create)
4. [Upsert](#invoices-upsert)


* * *

## Invoices Index

Please note that the index endpoint doesn't currently support pagination.

### Endpoint
```
GET https://<your_host>.finario.com/api/invoices
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/invoices?token=<your_api_token>
```
<h2/>


### Successful Response
#### Status
`200`

#### Body
```
[
  {
    "amount": {
      "cents": 2000000,
      "currency": "USD"
    },
    "assignment": {
      "organization_id": "<org_id>",
      "user_id": "<user_id>",
      "investment_id": "<investment_id>",
      "cost_id": "<cost_id>",
      "manually_unassigned": false
    },
    "date": "2016-11-30",
    "description": "An invoice we like a lot",
    "gl_line": "2",
    "id": "<invoice_id>",
    "number": "42",
    "po_line": "2",
    "po_number": "33",
    "po_type": "<po_type>"
    "reference": "<unique_reference_id>",
    "vendor_id": "<vendor_id>",
    "unique_cost_id": "<unique_cost_id>",
    "cost_category_id": "<cost_category_id>"
  },
  { <invoice 2> },
  ...
  { <invoice n> }
]

```

<h2/>

### Optional Parameters

The following query parameters can be included in the request. These params apply to the Investment the Invoices are assigned to. If an Invoice is not assigned to an Investment, it will not be returned while using these params.

All values should be encoded for URL. If typing into a browser all query parameters are separated by '&', for example after "token=your_token&closed=true&closed_within_days_ago=10"


Name | Example | Description
---- | ------- | -----------
`closed` | `closed=true` | Returns Invoices assigned to Investments that are closed. Use `closed=false` to return Invoices assigned to open Investments.
`closed_within_days_ago` | `closed_within_days_ago=30` | Takes an integer value, `x`. Returns Invoices assigned to Investments that were closed in the last `x` days.



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
  "po_type": "<po_type>",
  "vendor_id": "<vendor_id>",
  "unique_cost_id": "<unique_cost_id>",
  "cost_category_id": "<cost_category_id>"
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
`reference` | false | string | A unique external reference ID
`currency_iso_code` | false | string | e.g., "USD" or "EUR". If no currency is given, your account's base currency will be used.
`description` | false | string |
`po_number` | false | string | Purchase order number
`po_line` | false | string | Purchase order line
`po_type` | false | string | Purchase order type
`gl_line` | false | string | General ledger line
`vendor_id` | false | string | Vendor ID  
`unique_cost_id` | false | string | e.g., "abc123" This ID is used to match payments to a cost and must exist on the cost prior to using it for matching.

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
