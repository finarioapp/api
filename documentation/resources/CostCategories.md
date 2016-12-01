# Cost Categories Resources

1. [Index](#cost-categories-index)
2. [Create](#cost-categories-create)
3. [Update](#cost-categories-update)


* * *

## Cost Categories Index
Returns a list of all cost categories
<hr style="border-bottom: 1px solid #ddd"/>

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

<hr style="border-bottom: 1px solid #ddd"/>

### Response Status
`200`

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
* * *

## Cost Categories Create

### Endpoint

```
POST https://<your_host>.finario.com/api/cost_categories?token='your-api-token'
```

<hr style="border-bottom: 1px solid #ddd"/>

### Acceptable Parameters

Name | Required | Type | Notes
---- | :------: | :--: | -----
`name` | true | string |
`category_code` | | string |
`parent_name` | | string | If there is no category with the given name, a new category will be created.

<hr style="border-bottom: 1px solid #ddd"/>

### Successful Response
#### Status
`201`

#### Body
```
{
  category_code: '<category_code>',
  name: '<category_name>',
  id: '<category_id>'
}
```

<hr style="border-bottom: 1px solid #ddd"/>

### Errors
#### - Missing required fields
_status_: `422`, _body_: `{"errors":["Name can't be blank"]}`


* * *

## Cost Categories Update

## Investments Update

### Endpoint

```
PUT https://<your_host>.finario.com/api/cost_categories/<cost_category_id>?token='your-api-token'
```

<hr style="border-bottom: 1px solid #ddd"/>

### Acceptable Parameters
Please see the [list in the Cost Categories Create section above](#acceptable-parameters).

<hr style="border-bottom: 1px solid #ddd"/>

### Successful Response

#### Status
`200`

#### Body
```
{
  category_code: '<category_code>',
  name: '<category_name>',
  id: '<category_id>'
}
```

<hr style="border-bottom: 1px solid #ddd"/>

### Errors
#### - Cost Category Not Found
_status_: `404`, _body_: `{"errors":["Cost Category Not Found"]}`

#### - Missing required field
_status_: `422`, _body_: `{"errors":["Name can't be blank"]}`

