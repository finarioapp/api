# Costs Resources

1. [Index](#costs-index)
2. [Show](#costs-show)
3. [Create](#costs-create)

* * *

## Costs Index
Returns a list of all costs for a given investment.
<h2/>

### Endpoint
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/costs
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/costs?token=<your_api_token>
```

<h2/>

### Response Status
`200`

<h2/>

### Response Body
```
[
  {
    name: '<name>',
    id: '<cost_id>',
    description: '<description>',
    investment_id: '<investment_id>'
  },
  ...
]
```

* * *

## Costs Show

### Endpoint
`GET https://<your_host>.finario.com/api/investments/<investment_id>/costs/<cost_id>?token=<your_api_token>`

<h2/>

### Successful Response
#### Status
`200`

#### Body
```
{
  "account_id": "<account_id>",
  "approved": false,
  "cost_category_id": "<cost_category_id>",
  "unit_price": {
    "cents": 500000,
    "currency": "USD"
  },
  "freight": {
    "cents": 0,
    "currency": "USD"
  },
  "sales_tax_rule": {
    "rate": 5,
    "taxable": []
  },
  "expected_units": [
    {
      "date": [
        2015,
        10
      ],
      "quantity": "1",
      "unit_cost": {
        "cents": 500000,
        "currency": "USD"
      }
    }
  ],
  "id": "<cost_id>",
  "name": "<cost_name>",
  "vendor_id": null,
  "depreciable_cache": true,
  "forecast_spends": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "suspended_spends": [],
  "approved_spends": [],
  "actual_spends": [],
  "revised_forecast": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "forecasted_by_id": null,
  "forecasted_at": "2016-11-29T16:08:18-05:00",
  "base_forecast_total": {
    "cents": 500000,
    "currency": "USD"
  },
  "base_approved_total": {
    "cents": 0,
    "currency": "USD"
  },
  "base_spends": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "investment_closed_at": null
}
```

<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{"success":false,"message":"Cost Not Found"}`

* * *


## Costs Create

### Endpoint
`POST https://<your_host>.finario.com/api/investments/<investment_id>/costs?token=<your_api_token>`
<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`name` | true | string |
`account` | true | string | Must be the Name of an account that already exists in your Finario application.
`vendor_name` | | string | Must be the Name of a vendor that already exists in your Finario application.
`cost_category` | | string | Must be the Name of a Cost Category that already exists in your Finario application.
`apply_tax` | | string | Send value `yes` if tax should be applied.
`expected_units` | | array | An array of Expected Unit objects, e.g. `[{"quantity": 1, "project_month": "M3"}]`. If more than one expected_unit object is passed in, only the first in the array will be used.
expected_units_object[`quantity`] | | float |
expected_units_object[`project_month`] | | string | This should be the project month of the investment the cost occurs in. For example, if the investment has a start_date of January 2016, and the cost falls in February 2016, the project_month is "M2"; February 2017 is "M14".
`unit_price` | | hash |
`unit_price[dollars]` | | float |
`unit_price[currency]` | | string | For example "USD" or "EUR"
`freight` | | hash |
`freight[dollars]` | | float |
`freight[currency]` | | string | For example "USD" or "EUR"

<h2/>

### Successful Response
#### Status
`201`

#### Body
```
{
  "account_id": "<account_id>",
  "approved": false,
  "cost_category_id": "<cost_category_id>",
  "unit_price": {
    "cents": 500000,
    "currency": "USD"
  },
  "freight": {
    "cents": 0,
    "currency": "USD"
  },
  "sales_tax_rule": {
    "rate": 5,
    "taxable": []
  },
  "expected_units": [
    {
      "date": [
        2015,
        10
      ],
      "quantity": "1",
      "unit_cost": {
        "cents": 500000,
        "currency": "USD"
      }
    }
  ],
  "id": "<cost_id>",
  "name": "<cost_name>",
  "vendor_id": null,
  "depreciable_cache": true,
  "forecast_spends": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "suspended_spends": [],
  "approved_spends": [],
  "actual_spends": [],
  "revised_forecast": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "forecasted_by_id": null,
  "forecasted_at": "2016-11-29T16:08:18-05:00",
  "base_forecast_total": {
    "cents": 500000,
    "currency": "USD"
  },
  "base_approved_total": {
    "cents": 0,
    "currency": "USD"
  },
  "base_spends": [
    [
      {
        "cents": 500000,
        "currency": "USD"
      },
      [
        2015,
        10
      ]
    ]
  ],
  "investment_closed_at": null
}
```

<h2/>

### Errors
#### - Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### - Account not found
_status_: `406`, _body_: `{"success":false,"message":"Account 'Foo' Not Found"}`

#### - Missing required field
_status_: `422`, _body_: `{"errors":{"name":["can't be blank"]}}`

