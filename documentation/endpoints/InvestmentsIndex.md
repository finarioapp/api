Investments Index
----------------
Returns a list of all investments.

Organizational permissions are based on the user providing the authentication token.

***

### Endpoint
```
GET https://<your_host>.finario.com/api/investments
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/investments?token='your-api-token'
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
    id: '<investment_id>',
    investment_id: '<investment_code>',
    api_request: '<api request used to create the investment (if created via api)>',
    costs_path: '<resource locator for costs>'
  },
  ...
]
```
***

### Optional Parameters

The following query parameters can be included in the request to filter for investments that only meet these characteristics. Only investments that the user providing the token can see are included. All values should be encoded for URL.

If typing into a browswer all query parameters are separated by '&' for example after "token=whatever&start_month=7&start_year=2013..."


Name | Example | Description
---- | ------- | -----------
`start_month` | `start_month=7` | Investments with spend in or after July. Should be used with `start_year`.
`start_year` | `start_year=2013` | Investments with spend starting in 2013. Should be used with `start_month`.
`end_month` | `end_month=6` | Investments with spend in or before June. Should be used with `end_year`.
`end_year` | `end_year=2014` | Investments with spend in or before 2014. Should be used with `end_month`.
`keywords` | `keywords=one,two` | Investments that have both of the keywords 'one' AND 'two' (not OR). Multiple keywords should be separated by commas.
`organization` | `organization=Asia` | Investments in the "Asia" organization. The param must match the organization's display name (including capitalization and spaces).
`categories` | `categories[]=Foo` | Investments in the "Foo" category. The param must match the category's display name (including capitalization and spaces). Multiple investment categories can be used like so: `&categories[]=Baz&categories[]=Foo`.
`size_range` | `size_range=greater_than,$1M` | Investments with more than 1 million dollars in spends. (Yes, that is a comma). Only 'greater than' ranges defined in Approval Routes are valid. Ranges with lower and upper bounds can be defined like so: `greater_than,$500k-less_than,$1M`
`round` | `round=Approved` | Investments that are fully approved. Other values: '"Idea",' "Closed", "Denied", "Invalidated", "Pending", "Remanded", or the name of an approval round will return all investments currently in that round.
`budgeted_status` | `budgeted_status=budgeted` | Investments that have been added to a budget. The only other possible value is `unbudgeted`.
`vendor` | `vendor=Amazon` | Investments with the vendor "Amazon" associated with any of the investment's costs. The value should match the Vendor's display name (including capitalization and spaces).
Custom Fields | `c.Funding=Cash` | Investments with the custom field "Funding" set to "Cash". Parameter keys and values should match those defined within `<your_host>.finario.com`.
