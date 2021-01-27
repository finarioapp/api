Invoice Post
-------
Creates or updates an invoice

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/invoices/<your unique reference>.json?token='your-api-token'

        or

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/invoices/<your unique reference>
        Request Header: {
            x-api-token=<your-api-token>
            Accept=application/json
            Content-Type=application/json
        }

###Request

    {  amount: '<amount>',
       currency_iso_code: '<ISO Code>',
       date: '<document date>',
       reference: '<unique reference>'       
       number: '<invoice number>',
       description: '<description>',
       po_number: '<purchase order number>',
       po_line: '<purchase order line>',
       po_type: '<purchase order type>'
    }

###Response

    Status Code: 200

    Response Header: {
        location: https://<your_host>.finario.com/api/invoices/<reference>
    }

###Errors
   Status Code: (422)

    Response: {
    	field: ["<error>", ...], ...
    }

Invoice Get
-------
Retrieves an invoice

###Endpoint
Use the following endpoint to access this operation:

	GET
	https://<your_host>.finario.com/api/invoices/<your unique invoice reference>?vendor_id=<vendor name or id>
        Request Header: {
            x-api-token=<your-api-token>
            Accept=application/json
            Content-Type=application/json
        }
###Response

    Status Code: 200

    Response: {
        "account_id": '<account_id>',
        "amount": {
            "cents": 1234,
            "currency": "USD"
        },
        "api_request": "<date of API request>",
        "assignment": {
            "organization_id": "<organization id>",
            "user_id": "<assigned user>",
            "investment_id": "<investment id>",
            "cost_id": "<cost id>",
            "manually_unassigned": <true or false>
        },
        "cost_category_id": "<cost category id>",
        "date": "datetime",
        "description": "<description of invoice",
        "gl_line": "1234",
        "id": "id of invoice",
        "number": "B12345",
        "po_line": "1234",
        "po_number": "1234",
        "reference": "<your unique reference code>",
        "synchronized_at": "datetime",
        "vendor_id": "vendor id",
        "cost_category_name": "<cost category name>"
}
###Errors
   Status Code: (404)

    Response: {
            "success": false,
            "errors": "Invoice Not Found"
    }