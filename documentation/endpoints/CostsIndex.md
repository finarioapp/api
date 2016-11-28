Costs Index
----------
Returns a list of all costs for a given investment.

### Endpoint
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/costs
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/costs?token='your-api-token'
```

***

### Response Status
`200`

***

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
