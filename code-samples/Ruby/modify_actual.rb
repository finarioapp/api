require "json"
require "net/http"
require "net/https"

class ModifyActual

  TYPES = ['payments', 'orders', 'invoices']

  def initialize(type, investment_id, cost_id)

    raise 'invalid type' unless TYPES.include? type
    raise 'missing investment id' if investment_id.blank?
    raise 'missing cost id' if cost_id.blank?

    @endpoint = "https://<your_host>.finario.com/api/investments/#{investment_id}/costs/#{cost_id}/#{type}"
  end

  def update(secure_token, actual)
    raise 'id missing' if actual.finario_id.blank?

    request = {
      amount: actual.amount,
      currency: actual.currency,
      name: actual.name,
      description: actual.description,
      item_date: actual.item_date,
      payment_date: actual.payment_date
    }

    put_json(secure_token, actual.finario_id, request)
  end

  def put_json(secure_token, id, request = {})
    uri = URI.parse([@endpoint, id].join('/'))
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.put(uri.path, request.to_json, { 'Content-Type' =>'application/json', 'x-api-token' => secure_token }).body
    JSON.parse(response)
  end

  def delete(secure_token, finario_id)
    raise 'id missing' if finario_id.blank?
    uri = URI.parse([@endpoint, id].join('/'))
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.delete(uri.path, { 'Content-Type' =>'application/json', 'x-api-token' => secure_token }).body
    JSON.parse(response)
  end

end

my_payment = Payment.find('payment-1') #{finario_id: 'payment-1', amount: 10.00, currency: 'USD', name: 'Initiation Fee', description: 'Nickels and Dimes', item_date: 'Dec-31-2013', payment_date: 'Dec-31-2013'}

finario_payments = ModifyActual.new('payments', 'finario-investment-1-id', 'finario-cost-1-id')

finario_payments.update('ZZZ-Your-Secure-Token-ZZZ', my_payment)
finario_payments.delete('ZZZ-Your-Secure-Token-ZZZ', 'payment-1')
