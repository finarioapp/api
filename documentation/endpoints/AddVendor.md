AddVendor
---------
AddVendor creates a vendor

###Endpoint
Use the following endpoint to access this operation:

	POST
	https://<your_host>.finario.com/api/vendors?token='your-api-token'

        or

	POST
	https://<your_host>.finario.com/api/vendors
        Request Header: {
            x-api-token='your-api-token'
        }

###Request (*) - mandatory

    {  name: '<name (*)>',
       vendor_id: '<external vendor id (*)>',
       phone_number: '<phone number>',
       web_address: '<vendor URL>',
       address: '<street address>',
       city: '<city>',
       state: '<state>',
       postal_code: '<zip code>',
       country_code: '<country code>',
       contact_name: '<name of primary contact>',
       contact_email: '<email of priamry contact>',
       notes: '<any notes>'
    }

###Response

    Status Code: 201

    Response Body: {
      name: '<name>',
      id: '<id>',
      vendor_id: '<external vendor id>
    }

###Errors

   Status Code: (422)

    Response Body (JSON): {
      field: "<error>", ...
    }