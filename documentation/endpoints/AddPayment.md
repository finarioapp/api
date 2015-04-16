AddPayment
----------
AddPayment creates a payment

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/payments?token='your-api-token'

        or

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments
	https://<your_host>.finario.com/api/investments/:investment_id/payments
        Request Header: {
            x-api-token='your-api-token'
        }

###Request

    {  amount: '<amount>',
       currency_iso_code: '<ISO Code>',
       item_date: '<document date>',
       payment_date: '<date of event>',
       reference: '<your reference>'
    }

###Response

    Status Code: 201

    Response Header: {
        location: https://<your_host>.finario.com/api/payments
    }

###Errors
   Status Code: (422)

    Response Header: {
    	field: "<error>", ...
    }