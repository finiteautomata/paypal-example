@api = PayPal::SDK::AdaptivePayments.new

# Build request object
@pay = @api.build_pay({
  :actionType => "PAY",
  :cancelUrl => "http://localhost:3000/samples/adaptive_payments/pay",
  :currencyCode => "USD",
  :ipnNotificationUrl => "http://localhost:3000/samples/adaptive_payments/ipn_notify",
  :receiverList => {
    :receiver => [{
        :amount => 100.0,
        :email => "platfo_1255612361_per@gmail.com"
      },
      {
        :amount => 10.0,
        :email => "jmperez.85@gmail.com"
      }
      ] },
  :returnUrl => "http://localhost:3000/samples/adaptive_payments/pay" })

# Make API call & get response
@response = @api.pay(@pay)

# Access response
if @response.success? && @response.payment_exec_status != "ERROR"
  @response.payKey
  @api.payment_url(@response)  # Url to complete payment
else
  @response.error[0].message
end
