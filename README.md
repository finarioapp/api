Finario Connect API
===================
Our set of APIs enable seamless integration of Finario directly into your internal workflows, products and services.

The API uses JSON over HTTP to allow you to build applications capable of using or adding Finario data in your application.

##Checklist
* Visit the API section of your Finario application to get your API Key.
* Configure the white list of IP addresses that can access your API.
* Familiarize yourself with REST and the Finario resource names.
* Begin developing your application.

##Endpoints

###Lists
- **[<code>GET</code> Investments](https://github.com/finarioapp/connect/tree/master/documentation/endpoints/InvestmentsIndex.md)**
- **[<code>GET</code> Costs](https://github.com/finarioapp/connect/tree/master/documentation/endpoints/CostsIndex.md)**

###Operations
- **[<code>POST</code> AddActual](https://github.com/finarioapp/connect/tree/master/documentation/endpoints/AddActual.md)**


###Versions
The 'api' namespace returns the latest API. To reach version X of the API use 'api/vX'


###Authentication
All operations in the Finario Connect API require an authentication token argument provided in the RequestHeader.
An authentication token securely identifies the caller of an operation. When called, an operation checks the validity of
the provided authentication token before executing the request. A malformed, invalid, or expired token causes an
operation to fail.

###Secure-Only Operations
All operations are secure only. These operation must be called over an SSL
connection with a secure token from the user's registered IP address.

The required combination of passing a secure token over SSL prevents a "man-in-the-middle" 
exploitation where an attacker sniffs tokens from a non-SSL connection, then uses the token 
to impersonate the client, thereby possibly gaining access to sensitive information or 
processes. Operations that could expose sensitive data only accept secure tokens 
over SSL. As long as these tokens are always and only passed over SSL, attackers can 
never acquire a secure token with which to impersonate a valid customer.

The use of an IP whitelist to verify that the connection is being established from a known safe IP address provides another layer of security.  This multi-layered, "defense in depth" strategy ensures that API connections to Finario are always highly secure.

