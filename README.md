# README
## Api
* API for update Location status from devise

POST https://delivery-app-sobin.herokuapp.com/api/order_transits

```
{
	"order_transit" :
	{
		"location": "Madiwala",
		"order_id": "6",
		"status": "delivered",
		"agent_name": "Agent Vinod",
		"agent_phone_number": "12365447889"
	}
}

```
