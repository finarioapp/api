# Investment Resources

1. [Index](#investments-index)
2. [Show](#investments-show)
3. [Create](#investments-create)
4. [Update](#investments-update)


* * *


## Investments Index
Returns a list of all investments, scoped by the organizational permissions of the user providing the authentication token.

<h2/>

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

<h2/>

### Response Status
`200`

<h2/>

### Response Body
```
[
  {
    name: '<name>',
    id: '<id>',
    investment_id: '<investment code>',
    investment_category_name": '<investment category name>',
    api_request: '<api request used to create the investment (if created via api)>',
    costs_path: '<resource locator for costs>',
    organization_code: '<org code>'
  },
  ...
]
```
<h2/>

### Optional Parameters

The following query parameters can be included in the request to filter for investments that only meet these characteristics. Only investments that the user providing the token can see are included. All values should be encoded for URL.

If typing into a browser all query parameters are separated by '&' for example after "token=whatever&start_month=7&start_year=2013..."


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
Custom Fields | `c_Funding=Cash` | See [custom fields](#custom-fields) for more information


* * *

### Custom Fields
Custom fields will only be optional parameters if they are turned on within your account.
If you're unsure, ask your account manager whether or not you have access to custom fields.

Custom fields are formatted with a `c_` proceeding whatever you've named the custom field.

The example`c_Funding=Cash` will take you to the investments where the custom field "Funding" is set to "Cash'

Parameter keys and values should match what you've defined in your custom fields

## Investments Show

### Endpoint
`GET https://<your_host>.finario.com/api/investments/<investment id>?token='your-api-token'`

<h2/>

### Successful Response
#### Status
`200`

#### Body
```
[
  {
    name: '<name>',
    id: '<id>',
    investment_id: '<investment code>',
    investment_category_name": '<investment category name>',
    api_request: '<api request used to create the investment (if created via api)>',
    costs_path: '<resource locator for costs>',
    organization_code: '<org code>'
  },
  ...
]
```
<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{errors:["Not Found"]}`

* * *


## Investments Create

### Endpoint

```
POST https://<your_host>.finario.com/api/investments?token='your-api-token'
```
<h2/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`organization_code` | true^ | string | ^Either organization_code or organization_name is required. Must match a value that already exists in your Finario application.
`organization_name` | true^ | string | ^Either organization_code or organization_name is required. Must match a value that already exists in your Finario application.
`name` | true | string |
`investment_id` | | string | A unique ID from your external system. This is saved as the "Investment Code" in Finario, and can be used as a resource identifier for other API endpoints.
`investment_category_name` | true | string | Must match a value that already exists in your Finario application.
`owner_name` | true^ | string | ^Either owner_name or owner_email is required. Must match a value that already exists in your Finario application.
`owner_email` | true^ | string | ^Either owner_name or owner_email is required. Must match a value that already exists in your Finario application.
`project_start_as_time` | true | string | e.g., "Oct-2015". Year must be 4 digits. Month must be Jan, Feb, Mar, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
`in_service_date_as_time` | true | string | e.g., "Oct-2015". Year must be 4 digits. Month must be Jan, Feb, Mar, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec. This date must be after project_start_as_time
`description` | | string |
`rationale` | | string |
`api_request` | | string | Providing a value here will automatically add the keyword "api" to the created investment.

<h2/>

### Successful Response
#### Status
`201`

#### Body
```
{
  name: '<name>',
  id: '<investment id>',
  investment_id: '<investment code>',
  investment_category_name": '<investment category name>',
  api_request: '<api request used to create the investment (if created via api)>',
  costs_path: '<resource locator for costs>',
  organization_code: '<org code>'
}
```

<h2/>

### Errors
#### - Organization Not Found
_status_: `404`, _body_: `{"success":false,"message":"Organization Not Found"}`


#### - Missing required fields
_status_: `422`, _body_: `{"errors":["Name can't be blank","Project start can't be blank","In service date can't be blank","Estimated completion date can't be blank","Investment category can't be blank","Owner can't be blank"]}}`


#### - Invalid date sequence
_status_: `422`, _body_: `{"errors":["In service date cannot be before project start date"]}}`


* * *

## Investments Update

### Endpoint

```
PUT https://<your_host>.finario.com/api/investments/<investment id>?token='your-api-token'
```

<h2/>

### Acceptable Parameters
Please see the [list in the Investments Create section above](#acceptable-parameters).

<h2/>

### Successful Response

#### Status
`200`

#### Body
```
{
  name: '<name>',
  id: '<id>',
  investment_id: '<investment code>',
  investment_category_name": '<investment category name>',
  api_request: '<api request used to create the investment (if created via api)>',
  costs_path: '<resource locator for costs>',
  organization_code: '<org code>'
}
```

### Errors
#### - Organization Not Found
_status_: `422`, _body_: `{"errors":["Organization can't be blank"]}`

#### - Invalid date sequence
_status_: `422`, _body_: `{"errors":["In service date cannot be before project start date"]}}`
