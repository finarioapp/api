require "json"
require "net/http"
require "net/https"

class Invoice

  def initialize(investment_id, your_invoice = {})
    raise 'missing investment id' if investment_id.blank?
    raise 'your_invoice is missing or invalid' if your_invoice.blank? || your_invoice[:reference].blank? # reference must be unique
    puts "include a vendor to assign the invoice to a cost that uniquely has that vendor" if your_invoice[:vendor_id].blank?

    @investment_id = investment_id
    @your_invoice = your_invoice
  end

  def upsert(secure_token)
    endpoint = "https://<your_host>.finario.com/api/investments/#{@investment_id}/invoices/#{@your_invoice[:reference]}"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(
      uri.path,
      @your_invoice.to_json,
      { 'Accept' => 'application/json', 'Content-Type' =>'application/json', 'x-api-token' => secure_token })

    JSON.parse(response.body)
  end

end

invoice = Invoice.new('finario-investment-1-id',
                      amount: 10.00,
                      currency_iso_code: 'USD',
                      reference: 'unique-reference-001',
                      number: '100001',
                      date: 'Dec-31-2013',
                      vendor_id: 'dell',
                      description: 'the fist invoice',
                      po_number: '1001',
                      po_line: '1',
                      po_type: 'Type 1')

result = invoice.upsert('ZZZ-Your-Secure-Token-ZZZ')
