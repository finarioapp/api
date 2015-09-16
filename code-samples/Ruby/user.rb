require "json"
require "net/http"
require "net/https"

class User

  def initialize(your_user = {})
    raise 'your_user is missing or invalid' if your_user.blank? || your_user[:email].blank? # email must be unique

    @your_user = your_user
  end

  def upsert(secure_token)
    endpoint = "https://<your_host>.finario.com/api/users/#{@your_user[:email]}"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    response = http.post(
      uri.path,
      @your_user.to_json,
      { 'Accept' => 'application/json', 'Content-Type' =>'application/json', 'x-api-token' => secure_token })

    JSON.parse(response.body)
  end

end

user = User.new(first_name: 'Buck',
                last_name: 'Rogers',
                email: 'buck@spacelysprockets.moon',
                has_budgets_feature: 'Yes',
                has_approvals: 'No',
                has_actual_costs_feature: 'Yes',
                has_reports: 'No',
                authority_assignments: { '<authority name x>' => '<organization name a>' },
                permissions: { 'organization name b>' => 'Edit' } )

result = user.upsert('ZZZ-Your-Secure-Token-ZZZ')
