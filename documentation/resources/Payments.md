# Payments Resources

1. [Show](#payments-show)
2. [Create](#payments-create)
3. [Upsert](#payments-upsert)

* * *

## Payments Show

### Endpoint
```
GET https://<your_host>.finario.com/api/payments/<payment_id>
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/payments/<payment_id>?token=<your_api_token>
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
    "organization_id": "<organization_id>",
    "user_id": "<user_id>",
    "investment_id": "<investment_id>",
    "cost_id": "<cost_id>",
    "manually_unassigned": false
  },
  "date": "2016-11-22T00:00:00-05:00",
  "id": "<payment_id>",
  "vendor_id": "<vendor_id>"
}
```

<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{"success":false,"message":"Payment Not Found"}`

* * *

## Payments Create

### Endpoints
```
POST https://<your_host>.finario.com/api/payments/
```
or
```
POST https://<your_host>.finario.com/api/investments/<investment_id>/payments/
```
or
```
POST https://<your_host>.finario.com/api/investments/<investment_id>/costs/<cost_id>/payments/
```

<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`amount` | true | float |
`date` | true | time | e.g., "2016-11-30"
`reference` | true | string | A unique external reference ID
`description` | | string |
`invoice_number` | | string |
`check_number` | | string |
`po_type` | | string | Purchase order type
`po_number` | | string | Purchase order number
`po_line` | | string | Purchase order line
`vendor_id` | | string | Can use the internal Finario ID or your unique external vendor ID
`currency_iso_code` | | string | e.g., "USD" or "EUR". If no currency is given, your account's base currency will be used.

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
  "id": "<payment_id>",
  "number": "<invoice_number>",
  "reference": "<invoice_reference_id>",
  "vendor_id": "<vendor_id>"
}
```


<h2/>

#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"]}}`

#### - Duplicate Reference ID
_status_: `422`, _body_: `{"errors":{"reference":["has already been taken"]}}`

* * *


## Payments Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/investments/<investment_id>/payments/<payment_id>`

<h2/>

### Acceptable Parameters
Please see the [list in the Payments Create section above](#acceptable-parameters).

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

#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"]}}`

#### - Payment not found
This update endpoint works as an "upsert". If you use a Payment ID that doesn't exist, a new Payment will be created with the `reference` attribute set to the ID passed in.