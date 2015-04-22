CLIENT_ID=AfhQgMjbzJlgCDEnn0K0a16SFC0CuDWDd4gOQ4mGZYYx-Lq2Kf-IwkauUlMC4l2ZdurQxl0yp0ySAidF
SECRET_ID=EH8cy9Ctrf4I2VlFOQlgc9Vpoyj9IhRnLPHas_ex663cItkqVJC80UkMXsaOHGNHej8qUEdssUUOz7WL

# Have auth
ACCESS_TOKEN=`curl -v https://api.sandbox.paypal.com/v1/oauth2/token   -H "Accept: application/json"   -H "Accept-Language: en_US"   -u "$CLIENT_ID:$SECRET_ID"   -d "grant_type=client_credentials" | cat | jq -r ".access_token"`

# Create payment
curl -v https://api.sandbox.paypal.com/v1/payments/payment \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d '{
    "intent":"sale",
    "redirect_urls":{
      "return_url":"http://example.com/your_redirect_url.html",
      "cancel_url":"http://example.com/your_cancel_url.html"
    },
    "payer":{
      "payment_method":"paypal"
    },
    "transactions":[
      {
        "amount":{
          "total":"7.47",
          "currency":"USD"
        }
      }
    ]
  }'
