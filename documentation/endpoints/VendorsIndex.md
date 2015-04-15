VendorsIndex
----------
VendorsIndex returns a list of all Vendors.

###Endpoint
Use the following endpoint to access this operation:

	GET
	https://<your_host>.finario.com/api/vendors?token='your-api-token'

        or

	GET
    https://<your_host>.finario.com/api/vendors
        Request Header: {
            x-api-token='your-api-token'
        }

###Response

    [
        {  name: '<name>',
           id: '<id>',
           vendor_id: '<external vendor id>
        },
        ...
    ]
