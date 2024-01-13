require 'jwt'

module JwtToken
  extend ActiveSupport::Concern
  # SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  SECRET_KEY = "d836968389ab31502f5f71f6c91db4358c62a4ba9093cb53e824193f649ea4ff02f564c577c710c6f955b3a382a2388c0d8e694f5b14ccd6a05322891cf90354"

  def self.encode(payload, exp: 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
