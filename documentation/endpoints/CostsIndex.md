CostsIndex
----------
CostsIndex returns a list of all the investment's costs and their ids.

###Endpoint
Use the following endpoint to access this operation:

	GET
	https://<your_host>.finario.com/api/investments/:investment_id/costs?token='your-api-token'

        or

	GET
    https://<your_host>.finario.com/api/investments/:investment_id/costs
        Request Header: {
            x-api-token='your-api-token'
        }

###Response

    [
        {  name: '<name>',
           id: '<cost_id>',
           description: '<description>',
           investment_id: '<investment_id>
        },
        ...
    ]
