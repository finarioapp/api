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

    Amount
    Currency
    Name
    Description
    Item Date
    Payment Date

###Response

    Status Code: 201

    Response Header: {
        location: https://<your_host>.finario.com/api/investments/:investment_id/costs/:cost_id/invoices/:invoice_id
    }

###Errors
   Status Code: (not 201)

    Response Header: {
        errors: [
            amount: error
            item_date: error
            ...
        ]