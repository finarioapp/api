ModifyActual
------------
ModifyActual updates an invoice, order, or payment

###Endpoint
Use the following endpoint to access this operation:

	PUT
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:id?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders/:id?token='your-api-token'
	https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments/:id?token='your-api-token'

        or

	PUT
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:id
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/orders/:id
    https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/payments/:id
        Request Header: {
            x-api-token='your-api-token'
        }

###Request

    Amount
    Currency
    Name
    Description
    Item Date
    Payment Date

###Response

    Status Code: 2xx

    Response Header: {
        location: https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:invoice_id
    }

###Errors
   Status Code: (not 2xx)

    Response Header: {
        errors: [
            amount: error
            item_date: error
            ...
        ]