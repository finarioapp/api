Cost Categories Index
----------
Returns a list of all cost categories.

### Endpoint
```
GET https://<your_host>.finario.com/api/cost_categories
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/cost_categories?token='your-api-token'
```

***

### Response Status
`200`

***

### Response Body
```
[
  {
    category_code: '<category_code>',
    name: '<category_name>',
    id: '<category_id>'
  },
  ...
]
```
