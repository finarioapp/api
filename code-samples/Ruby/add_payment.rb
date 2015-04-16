require "json"
require "net/http"
require "net/https"

class AddActual

  def initialize(investment_id, cost_id = '')
    raise 'missing investment id' if investment_id.blank?

    @endpoint = [ "https://<your_host>.finario.com/api/investments/#{investment_id}",
                  cost_id.present? ? "/costs/#{cost_id}" : nil,
                  "/payments" ].compact.join('')
  end

  def create(secure_token, actual)
    request = {
      amount: actual.amount,
      currency_iso_code: actual.currency_iso_code,
      payment_date: actual.payment_date,
      reference: actual.reference,
      vendor_id: actual.vendor_id
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

my_payment = Payment.new(amount: 10.00, currency_iso_code: 'USD', reference: 'Initiation Fee', payment_date: 'Dec-31-2013', vendor_id: 'Dell')

finario_payments = AddActual.new('payments', 'finario-investment-1-id', 'finario-cost-1-id')
finario_payments.create('ZZZ-Your-Secure-Token-ZZZ', my_payment)
