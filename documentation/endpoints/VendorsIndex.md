Vendors Index
----------
Returns a list of all Vendors.

### Endpoint
```
GET https://<your_host>.finario.com/api/vendors
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/vendors?token='your-api-token'
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
    id: '<id>',
    vendor_id: '<external vendor id>'
  },
  ...
]
```
