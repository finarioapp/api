## Finario API
Our set of RESTful APIs enable seamless integration of Finario directly into your internal workflows, products and services.

The API uses JSON over HTTPS to allow you to build applications capable of using or adding Finario data in your application.

***

## Checklist
* Visit the API section of your Finario application: `https://<your_host>.finario.com/profile/api_token`.
  - Get your API Key.
  - Configure the white list of IP addresses that can access your API.
* Familiarize yourself with our authentication process and the Finario resource names.
* Begin developing your application.

***

## Authentication
All operations in the Finario API require an authentication token. An authentication token securely identifies the caller of an operation. When called, an operation checks the validity of the provided authentication token before executing the request. A malformed, invalid, or expired token causes an
operation to fail.

Across all API requests, organizational permissions are honored based on the user providing the authentication token. A common practice is to create an API user (within your Finario application) with permissions for the highest-level organization(s).

The authentication token can be provided in the RequestHeader or as URL query parameter.

__Request header example:__
```
GET https://<your_host>.finario.com/api/investments?token='your-api-token'
  Request Header: {
    x-api-token='your-api-token'
  }
```

__URL query parameter example:__
```
GET https://<your_host>.finario.com/api/investments?token='your-api-token'
```
***


## Endpoints

### Lists
- **[<code>GET</code> Costs](https://github.com/finarioapp/api/blob/master/documentation/endpoints/CostsIndex.md)**
- **[<code>GET</code> Cost Categories](https://github.com/finarioapp/api/blob/master/documentation/endpoints/CostCategories.md)**
- **[<code>GET</code> Investments](https://github.com/finarioapp/api/blob/master/documentation/endpoints/InvestmentsIndex.md)**
- **[<code>GET</code> Vendors](https://github.com/finarioapp/api/blob/master/documentation/endpoints/VendorsIndex.md)**

### Operations
- **[<code>POST</code> User](https://github.com/finarioapp/api/blob/master/documentation/endpoints/User.md)**
- **[<code>POST</code> Payment](https://github.com/finarioapp/api/blob/master/documentation/endpoints/Payment.md)**
- **[<code>POST</code> Invoice](https://github.com/finarioapp/api/blob/master/documentation/endpoints/Invoice.md)**
- **[<code>POST</code> PurchaseOrder](https://github.com/finarioapp/api/blob/master/documentation/endpoints/PurchaseOrder.md)**
- **[<code>POST</code> Vendor](https://github.com/finarioapp/api/blob/master/documentation/endpoints/Vendor.md)**
***


### Secure-Only Operations
All operations are secure only. These operation must be called over an SSL
connection with a secure token from the user's registered IP address.

The required combination of passing a secure token over SSL prevents a "man-in-the-middle"
exploitation where an attacker sniffs tokens from a non-SSL connection, then uses the token
to impersonate the client, thereby possibly gaining access to sensitive information or
processes. Operations that could expose sensitive data only accept secure tokens
over SSL. As long as these tokens are always and only passed over SSL, attackers can
never acquire a secure token with which to impersonate a valid customer.

The use of an IP whitelist to verify that the connection is being established from a known safe IP address provides another layer of security.  This multi-layered, "defense in depth" strategy ensures that API connections to Finario are always highly secure.


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-12231760-2', 'auto');
  ga('send', 'pageview');

</script>
