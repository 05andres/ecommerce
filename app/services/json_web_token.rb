require 'jwt'

module JsonWebToken
  SECRET_KEY = ENV['JTW_SECRET_KEY']

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      begin
        decoded_token = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
        return decoded_token[0].with_indifferent_access
      rescue JWT::DecodeError => e
        nil
      end
    end
  end
end
