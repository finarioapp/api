User
----
Creates and /or updates a user

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/users/<email_address>.json?token='your-api-token'

        or

	POST
	https://<your_host>.finario.com/api/users/<email_address>
        Request Header: {
            x-api-token='your-api-token'
            Accept=application/json
            Content-Type=application/json
        }

###Request (*) - mandatory

    {  first_name: '<First Name>',
       last_name: '<Last Name>',
       email: '<Email Address>',
       has_budgets_feature: '<Access to Budgets - yes or no>',
       has_approvals: '<Access to Approvals - yes or no>',
       has_actual_costs_feature: '<Access to Actual Costs - yes or no>',
       has_reports: '<Access to Reports - yes or no>',
       authority_assignments: { '<authority name x>' => '<organization name a>' },
       permissions: { 'organization name b>' => 'Edit' }
    }

###Response

    Status Code: 201

    Response Header: {
        location: https://<your_host>.finario.com/api/user/<user_id>
    }

###Errors

   Status Code: (422)

    Response Body (JSON): {
      field: "<error>", ...
    }