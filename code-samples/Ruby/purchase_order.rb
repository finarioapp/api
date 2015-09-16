require "json"
require "net/http"
require "net/https"

class PurchaseOrder

  def initialize(investment_id, your_purchase_order = {})
    raise 'missing investment id' if investment_id.blank?
    raise 'your_purchase_order is missing or invalid' if your_purchase_order.blank? || your_purchase_order[:reference].blank? # reference must be unique
    puts "include a vendor to assign the purchase_order to a cost that uniquely has that vendor" if your_purchase_order[:vendor_id].blank?

    @investment_id = investment_id
    @your_purchase_order = your_purchase_order
  end

  def upsert(secure_token)
    endpoint = "https://<your_host>.finario.com/api/investments/#{@investment_id}/purchase_orders/#{@your_purchase_order[:reference]}"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(
      uri.path,
      @your_purchase_order.to_json,
      { 'Accept' => 'application/json', 'Content-Type' =>'application/json', 'x-api-token' => secure_token })

    JSON.parse(response.body)
  end

end

purchase_order = PurchaseOrder.new('finario-investment-1-id',
                      amount: 10.00,
                      currency_iso_code: 'USD',
                      reference: 'unique-reference-001',
                      date: 'Dec-31-2013',
                      vendor_id: 'dell',
                      description: 'the fist purchase_order',
                      po_number: '1001',
                      po_line: '1',
                      po_type: 'Type 1')

result = purchase_order.upsert('ZZZ-Your-Secure-Token-ZZZ')
