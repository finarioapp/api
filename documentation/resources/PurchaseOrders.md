# Purchase Orders Resources

1. [Index](#purchase-orders-index)
2. [Show](#purchase-orders-show)
3. [Create](#purchase-orders-create)
4. [Upsert](#purchase-orders-upsert)


* * *

## Purchase Orders Index

* Please note that the index endpoint doesn't currently support pagination.

### Endpoint
```
GET https://<your_host>.finario.com/api/purchase_orders
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/purchase_orders?token=<your_api_token>
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
      "cents": 10000,
      "currency": "USD"
    },
    "assignment": {
      "organization_id": "<org_id>",
      "user_id": "<user_id>",
      "investment_id": "<investment_id>",
      "cost_id": "<cost_id>",
      "manually_unassigned": false
    },
    "date": "2017-10-03",
    "description": "A purchase order we like a lot",
    "id": "<po_id>",
    "po_line": "1000",
    "po_number": "3",
    "po_type": "Regular",
    "reference": "<unique_ref_id>",
    "vendor_id": "<vendor_id>"
  },
  { <purchase_order 2> },
  ...
  { <purchase_order n> }
]

```



* * *

## Purchase Orders Show

### Endpoint
```
GET https://<your_host>.finario.com/api/purchase_orders/<purchase_order_id>
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/purchase_orders/<purchase_order_id>?token=<your_api_token>
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
  "id": "<purchase_order_id>",
  "po_line": "<po_line>",
  "po_number": "<po_number>",
  "vendor_id": null
}
```

<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{"success":false,"message":"Purchase Order Not Found"}`

* * *

## Purchase Orders Create

### Endpoint
`POST https://<your_host>.finario.com/api/investments/<investment_id>/purchase_orders?token=<your_api_token>`
<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`amount` | true | float |
`date` | true | time | e.g., "2016-11-30"
`po_number` | true | string | Purchase order number
`po_line` | true | string | Purchase order line
`reference` | true | string | A unique external reference ID
`description` | | string |
`po_type` | | string | Purchase order type
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
    "organization_id": "<organization_id>",
    "user_id": "<user_id>",
    "investment_id": "<investment_id>",
    "cost_id": "<cost_id>",
    "manually_unassigned": false
  },
  "date": "2016-11-22T00:00:00-05:00",
  "id": "<purchase_order_id>",
  "po_line": "<po_line>",
  "po_number": "<po_number>",
  "vendor_id": null
}
```

<h2/>

### Errors
#### - Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"],"po_number":["can't be blank"],"po_line":["can't be blank"]}}`


* * *


## Purchase Orders Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/investments/<investment_id>/purchase_orders/<purchase_order_id>`

<h2/>

### Acceptable Parameters
Please see the [list in the Purchase Orders Create section above](#acceptable-parameters).

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
_status_: `422`, _body_: `{"errors":{"date":["can't be blank"],"amount":["can't be blank"],"po_number":["can't be blank"],"po_line":["can't be blank"]}}`

#### - Purchase Order not found
This update endpoint works as an "upsert". If you use a Purchase Order ID that doesn't exist, a new Purchase Order will be created for the given investment. A new ID will be created; the one used in the endpoint's URL will be disregarded. Please pass in a `reference` if you'd like to assign a unique external reference ID to the Purchase Order.
