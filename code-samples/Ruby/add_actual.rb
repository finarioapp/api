require "json"
require "net/http"
require "net/https"

class AddActual

  TYPES = ['payments', 'orders', 'invoices']

  def initialize(type, investment_id, cost_id)

    raise 'invalid type' unless TYPES.include? type
    raise 'missing investment id' if investment_id.blank?
    raise 'missing cost id' if cost_id.blank?

    @endpoint = "https://<your_host>.finario.com/api/investments/#{investment_id}/costs/#{cost_id}/#{type}"
  end

  def create(secure_token, actual)
    request = {
      amount: actual.amount,
      currency: actual.currency,
      name: actual.name,
      description: actual.description,
      item_date: actual.item_date,
      payment_date: actual.payment_date
    }
    post_json(secure_token, request)
  end

  def post_json(secure_token, request = {})
    uri = URI.parse(@endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(uri.path, request.to_json, { 'Content-Type' =>'application/json', 'x-api-token' => secure_token }).body
    JSON.parse(response)
  end

end

my_payment = Payment.new(amount: 10.00, currency: 'USD', name: 'Initiation Fee', description: 'Nickels and Dimes', item_date: 'Dec-31-2013', payment_date: 'Dec-31-2013')

finario_payments = AddActual.new('payments', 'finario-investment-1-id', 'finario-cost-1-id')
finario_payments.create('ZZZ-Your-Secure-Token-ZZZ', my_payment)

#todo : show how to get finario_id back from JSON response