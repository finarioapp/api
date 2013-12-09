InvestmentsIndex
----------------
InvestmentsIndex returns a list of all the investment names and their ids.

###Endpoint
Use the following endpoint to access this operation:

	GET
	https://<your_host>.finario.com/api/investments?token='your-api-token'

        or

	GET
    https://<your_host>.finario.com/api/investments
        Request Header: {
            x-api-token='your-api-token'
        }


###Response

    [
        {  name: '<name>',
           id: '<investment_id>',
           costs: '<resource locator for costs>'
        },
        ...
    ]
