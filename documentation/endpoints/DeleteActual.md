DeleteActual
------------
DeleteActual deletes an invoice, order, or payment

###Endpoint
Use the following endpoint to access this operation:

	DELETE
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:id?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders/:id?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments/:id?token='your-api-token'

        or

	DELETE
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:id
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders/:id
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments/:id
        Request Header: {
            x-api-token='your-api-token'
        }

###Response

    Status Code: 200

###Errors
   Status Code: (not 200)

    Response Header: {
        errors: [
            amount: error
            item_date: error
            ...
        ]