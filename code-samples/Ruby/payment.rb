require "json"
require "net/http"
require "net/https"

class Payment

  def initialize(investment_id, your_payment = {})
    raise 'missing investment id' if investment_id.blank?
    raise 'your_payment is missing or invalid' if your_payment.blank? || your_payment[:reference].blank? # reference must be unique
    puts "include a vendor to assign the payment to a cost that uniquely has that vendor" if your_payment[:vendor_id].blank?

    @investment_id = investment_id
    @your_payment = your_payment
  end

  def upsert(secure_token)
    endpoint = "https://<your_host>.finario.com/api/investments/#{@investment_id}/payments/#{@your_payment[:reference]}"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(
      uri.path,
      @your_payment.to_json,
      { 'Accept' => 'application/json', 'Content-Type' =>'application/json', 'x-api-token' => secure_token })

    JSON.parse(response.body)
  end

end

payment = Payment.new('finario-investment-1-id',
                      amount: 10.00,
                      currency_iso_code: 'USD',
                      reference: 'unique-reference-001',
                      date: 'Dec-31-2013',
                      vendor_id: 'dell',
                      description: 'the fist payment',
                      invoice_number: '100001',
                      check_number: '101',
                      po_number: '1001',
                      po_line: '1',
                      po_type: 'Type 1')

result = payment.upsert('ZZZ-Your-Secure-Token-ZZZ')
