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
All operations in the Finario API require an authentication token. An authentication token securely identifies the caller of an operation. When called, an operation checks the validity of the provided authentication token before executing the request. A malformed, invalid, or expired token causes an operation to fail.

Across all API requests, organizational permissions are honored based on the user providing the authentication token.

The authentication token can be provided in the Request Header or as URL query parameter.

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

* Please note that the authentication token is sometimes omitted throughout this documentation. This is for clearer presentation only. It is not meant to imply that the token is optional for those endpoints.

***


## Resources (endpoints)
- **[Approvals](https://github.com/finarioapp/api/blob/master/documentation/resources/Approvals.md)** (show, create)
- **[Costs](https://github.com/finarioapp/api/blob/master/documentation/resources/Costs.md)** (index, show, create)
- **[Cost Categories](https://github.com/finarioapp/api/blob/master/documentation/resources/CostCategories.md)** (index, create, update)
- **[Investments](https://github.com/finarioapp/api/blob/master/documentation/resources/Investments.md)** (index, show, create, update)
- **[Invoices](https://github.com/finarioapp/api/blob/master/documentation/resources/Invoices.md)** (show, create, upsert)
- **[Organizations](https://github.com/finarioapp/api/blob/master/documentation/resources/Organizations.md)** (index, create)
- **[Payments](https://github.com/finarioapp/api/blob/master/documentation/resources/Payments.md)** (show, create, upsert)
- **[Purchase Orders](https://github.com/finarioapp/api/blob/master/documentation/resources/PurchaseOrders.md)** (show, create, upsert)
- **[Users](https://github.com/finarioapp/api/blob/master/documentation/resources/Users.md)** (show, upsert)
- **[Vendors](https://github.com/finarioapp/api/blob/master/documentation/resources/Vendors.md)** (index, create, upsert)


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

***


## Web Hooks (outgoing from Finario)
- **[Post-Approval](https://github.com/finarioapp/api/blob/master/documentation/web_hooks/PostApproval.md)**

