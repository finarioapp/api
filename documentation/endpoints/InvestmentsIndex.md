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

###Additional Search Query Parameters

The following query parameters can be included in the request to filter for investments that only meet these characteristics. By default, the current fiscal year's investments are returned. Only investments that the user
providing the token can see are included. All values should be encoded for URL.

Example
-------

####start_month=7
start on or before july

####start_year=2013
start on or before 2013

####end_month=6
end by June

####end_year=2014
end before 2014

####keywords=one two
have the keywords one or two

####organization=B.C.
are in the "B.C." organization

####categories[]=Asset Replacement
have the investment category "Asset Replacement" (include the brackets)
additional investment categories can be added to find those matching investments as well

####size_range=greater_than,$1M
more than $1MM in spends (yes that is a comma) only 'greater than' ranges defined in Approval Routes are valid 
other examples: "greater_than,$1M", "less_than,$1M-greater_than,$500k"

####round=Approved
are fully approved

####budgeted_status=budgeted
are in a budget

####vendor=Amazon
use the vender "Amazon"

####c.Funding=Cash
include the custom field "Funding" set to "Cash"
