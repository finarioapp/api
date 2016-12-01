# Approvals Resources

1. [Show](#approvals-show)
2. [Create](#approvals-create)

* * *

## Approvals Show

### Endpoint
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/approvals/<approval_id>
  Request Header: {
    x-api-token='your-api-token',
    Content-Type='application/json'
  }
```
```
GET https://<your_host>.finario.com/api/investments/<investment_id>/approvals/<approval_id>?token=<your_api_token>
```

<h2/>

### Response Status
`200`

<h2/>

### Response Body
```
{
  "approval_round_id": "<approval_round_id>",
  "approval_round_name_cache": "<name of round this approval belongs to>",
  "approver_first_name_cache": "<first name of approver>",
  "approver_last_name_cache": "<last name of approver>",
  "approver_id": "<user id of approver>",
  "comment_count_cache": 0,
  "created_at": "2012-05-05T19:42:54-04:00",
  "creator_id": "<user id of approval creator>",
  "id": "<approval_id>",
  "invalidated_at": "2016-05-26T16:46:20-04:00",
  "investment_id": "<investment_id>",
  "latest_comment_id": null,
  "organization_id": "<organization_id>",
  "status_cache": <a numeric value representing the current approval status>,
  "updated_at": "2016-05-26T16:46:20-04:00",
  "updater_id": "<user id of last approval updater>",
}
```

<h2/>

### Errors
#### Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### Approval not found
_status_: `404`, _body_: `{"success":false,"message":"Approval Not Found"}`

* * *


## Approvals Create
This operation will submit the investment to the first approver in the approval list. It changes the investment's status from "Idea" to "Pending".
<h2/>

### Endpoint
`POST https://<your_host>.finario.com/api/investments/<investment_id>/approvals`

<h2/>

### Successful Response
#### Status
`201`

#### Body
```
{
  "approval_round_id": "<approval_round_id>",
  "approval_round_name_cache": "<name of round this approval belongs to>",
  "approver_first_name_cache": "<first name of approver>",
  "approver_last_name_cache": "<last name of approver>",
  "approver_id": "<user id of approver>",
  "comment_count_cache": 0,
  "created_at": "2012-05-05T19:42:54-04:00",
  "creator_id": "<user id of approval creator>",
  "id": "<approval_id>",
  "invalidated_at": "2016-05-26T16:46:20-04:00",
  "investment_id": "<investment_id>",
  "latest_comment_id": null,
  "organization_id": "<organization_id>",
  "status_cache": <a numeric value representing the current approval status>,,
  "updated_at": "2016-05-26T16:46:20-04:00",
  "updater_id": "<user id of last approval updater>",
}
```

<h2/>

### Errors
#### Investment not found
_status_: `404`, _body_: `{"success":false,"message":"Investment Not Found"}`

#### Approval not found
_status_: `404`, _body_: `{"success":false,"message":"Approval Not Found"}`

#### Investment can't be submitted for approval because it is not an Idea
_status_: `406`, _body_: `{"success":false,"message":"Investment not an idea"}`

#### No approval routes were found to fit the investment's size and/or other criteria.
_status_: `404`, _body_: `{"success":false,"message":"Approval Not Found"}`

