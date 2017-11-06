# Users Resources

1. [Index](#users-index)
2. [Show](#users-show)
3. [Upsert](#users-upsert)


* * *


## Users Index

### Endpoint
```
GET https://<your_host>.finario.com/api/users
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/users?token=<your_api_token>
```

<h2/>

### Successful Response
#### Status
`200`

#### Body
```
[
  {
    "id": "abc123",
    "name": "John Doe",
    "email": "john.doe@finario.com",
    "external_id": "x19221zz5",
    "authority_assignments": [
      {
        "authority": "Project Manager",
        "organization": "Northeast"
      }
    ],
    "permissions": [
      {
        "name": "View\/Edit",
        "organization": "Northeast"
      }
    ],
    "has_actual_costs_feature": true,
    "has_approvals": true,
    "has_budgets_feature": true,
    "has_portfolios_feature": true,
    "has_reports": true,
    "active_for_authentication": true,
    "last_modified": "2017-11-06T11:37:39-05:00"
  },
  ...
]
```

<h2/>

#### Please note:
The Users index endpoint does not have pagination. The endpoint will return all users, regardless of how many are in your Finario application.


* * *


## Users Show

### Endpoint
```
GET https://<your_host>.finario.com/api/users/<user_email>
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/users/<user_email>?token=<your_api_token>
```

<h2/>

### Successful Response
#### Status
`200`

#### Body
```
{
  "id": "abc123",
  "name": "John Doe",
  "email": "john.doe@finario.com",
  "external_id": "x19221zz5",
  "authority_assignments": [
    {
      "authority": "Project Manager",
      "organization": "Northeast"
    }
  ],
  "permissions": [
    {
      "name": "View\/Edit",
      "organization": "Northeast"
    }
  ],
  "has_actual_costs_feature": true,
  "has_approvals": true,
  "has_budgets_feature": true,
  "has_portfolios_feature": true,
  "has_reports": true,
  "active_for_authentication": true,
  "last_modified": "2017-11-06T11:37:39-05:00"
}
```

<h2/>

### Errors
#### Not Found
_status_: `404`, _body_: `{"success":false,"message":"User Not Found"}`


* * *


## Users Upsert

### Endpoint
`PUT https://<your_host>.finario.com/api/users/<user_email>?token=your-api-token`
<h2/>

### Acceptable Parameters
Name | Required | Type | Notes
---- | :------: | :--: | -----
`first_name` | true | string |
`last_name` | true | string |
`external_id` | | string |
`has_budgets_feature` | | boolean |
`has_approvals` | | boolean |
`has_actual_costs_feature` | | boolean |
`has_portfolios_feature` | | boolean |
`has_reports` | | boolean |
`authority_assignments` | | array | An array of Authority Assignment objects, e.g., `[{"authority": "foo", "organization": "bar"}]`
authority_assignment_object[`authority`] | | string | Must match an authority assignment `name` that already exists in your Finario application.
authority_assignment_object[`organization`] | | string | Must match an organization `name` that already exists in your Finario application.
`permissions` | | array | An array of Permission objects, e.g., `[{"name": "foo", "organization": "bar"}]`
permission_object[`name`] | | string | As of now, "Edit" is the only level of permissions supported.
permission_object[`organization`] | | string | Must match an organization `name` that already exists in your Finario application.

<h2/>

### Successful Response
#### Status
`204`
#### Body
`null`

<h2/>

### Errors
#### - Missing required fields
_status_: `422`, _body_: `{"errors":{"first_name":["can't be blank"],"last_name":["can't be blank"]}}`

#### - Duplicate external id
_status_: `422`, _body_: `{"errors":{"external_id":["has already been taken"]}}`

#### - Not found
__PLEASE NOTE__: This update endpoint works as an "upsert". If you use an email address that doesn't belong to a pre-existing user, a new user will be created.

However, not found messages can arise when trying to update authority assignments and permissions.

_status_: `422`, _body_: `{"authority_assignments":["can't find authority: Foo","can't find organization: Bar"]}`

_status_: `422`, _body_: `{"permissions":["can't find organization: Foo"]}`
