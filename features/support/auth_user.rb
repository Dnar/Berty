module AuthUser
  class << self
    def auth_crm
      sms_url = ENV.fetch('AUTH_HOST', '0.0.0.0:3002')

      code = JSON.parse(
        `curl #{sms_url}/api/support/sms_codes/list_for_phone/79999999999?limit=1`
        ).first['code']
    end
  end
end
