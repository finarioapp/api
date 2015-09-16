Payment
----------
Creates and / or updates a payment

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/payments/<your unique reference>.json?token='your-api-token'

        or

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/payments/<your unique reference>
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
       description: '<description>',
       invoice_number: '<invoice number>',
       check_number: '<check number>',
       po_number: '<purchase order number>',
       po_line: '<purchase order line>',
       po_type: '<purchase order type>'
    }

###Response

    Status Code: 200

    Response Header: {
        location: https://<your_host>.finario.com/api/payments/<reference>
    }

###Errors
   Status Code: (422)

    Response: {
    	field: ["<error>", ...], ...
    }