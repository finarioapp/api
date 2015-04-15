require "json"
require "net/http"
require "net/https"

class AddVendor

  def initialize
    @endpoint = "https://<your_host>.finario.com/api/vendors"
  end

  def create(secure_token, actual)
    request = {
      name: actual.name,
      vendor_id: actual.id
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