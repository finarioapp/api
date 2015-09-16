require "json"
require "net/http"
require "net/https"

class Vendor

  def initialize(your_vendor = {})
    raise 'your_vendor is missing or invalid' if your_vendor.blank? || your_vendor[:vendor_id].blank? # reference must be unique

    @your_vendor = your_vendor
  end

  def upsert(secure_token)
    endpoint = "https://<your_host>.finario.com/api/vendors/#{@your_vendor[:vendor_id]}"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(
      uri.path,
      @your_vendor.to_json,
      { 'Accept' => 'application/json', 'Content-Type' =>'application/json', 'x-api-token' => secure_token })

    JSON.parse(response.body)
  end

end

vendor = Vendor.new(name: 'Spacely Sprockets',
                    vendor_id: 'spacely',
                    web_address: 'http://www.spacelysprockets.moon',
                    address: '1234 Neil Armstrong Blvd, Lunar Colony 1',
                    city: 'Luna',
                    state: 'Moon',
                    postal_code: 'L1',
                    country_code: 'Lunar Colony',
                    contact_name: 'Buck Rogers',
                    contact_email: 'buck@spacelysprockets.com',
                    notes: '225K Miles from NYC')

result = vendor.upsert('ZZZ-Your-Secure-Token-ZZZ')
