AddActual
---------
AddActual creates an invoice, order, or payment

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments?token='your-api-token'

        or

	POST
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments
        Request Header: {
            x-api-token='your-api-token'
        }

###Request

    {  amount: '<amount>',
       currency_iso_code: 'ISO Code',
       reference: '<your reference>',
       item_date: '<document date>',
       payment_date: '<date of event>'
    }

###Response

    Status Code: 201

    Response Header: {
        location: https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:invoice_id
    }

###Errors
   Status Code: (422)

    Response Header: {
    	success: false,
    	message: "<summary of error message>"
        errors: [
            field: "<error>",
            ...
        ]
