require "json"
require "net/http"
require "net/https"

class VendorsIndex

  def initialize
    @endpoint = "https://<your_host>.finario.com/api/vendors"
  end

  def get_json(secure_token)
    uri = URI.parse(@endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.get(uri.path, { 'Content-Type' =>'application/json', 'x-api-token' => secure_token }).body
    JSON.parse(response)
  end

end
