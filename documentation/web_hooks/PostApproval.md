# Post-Approval Web Hook

* * *

## Set Up (in the Finario App)

After an investment is approved, Finario can send the investment's data to an API endpoint of your choosing.

An Administrator can set up Web Hooks at https://<your_host>.finario.com/web_hooks

The information required is as follows:
- End point (the url Finario will send the investment payload to after approval)
- Api key (if needed for your end point)
- Api secret (if needed for your end point)
- The conditions that should trigger the payload being sent. (Please note that these conditions will only be matched after an investment has been fully approved.)

You can also send test requests to the end point you set up from within the Finario app.

* * *

## Sample Payload

```
{
  "name": "Foo Investment",
  "Custom Field 1 Name": "The Name 1",
  "Custom Field 2 Name": "The Name 2",
  "project_start": [
    2017,
    4
  ],
  "estimated_completion_date": [
    2017,
    9
  ],
  "costs": [
    {
      "name": "First Cost",
      "account": "Account Name or Code",
      "cost_category": "Cost Category Name",
      "expected_units": [
        {
          "date": [
            2017,
            2
          ],
          "quantity": "1",
          "unit_cost": {
            "cents": 200000000,
            "currency": "USD"
          }
        },
        {
          "date": [
            2017,
            8
          ],
          "quantity": "1",
          "unit_cost": {
            "cents": 200000000,
            "currency": "USD"
          }
        }
      ],
      "vendor": "VENDOR-CODE"
    }
  ]
}

```
