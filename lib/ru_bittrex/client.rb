require 'faraday'
require 'digest'
require 'openssl'
require 'uri'
require 'json'

module RuBittrex
  class Client
    include ClientApi

    API_URI = 'https://api.bittrex.com/v3'

    attr_reader :secret, :api_key

    def initialize(opts = {})
      raise AuthError.new('You must provide API key and Secret') unless opts[:secret] && opts[:api_key]

      @secret = opts[:secret]
      @api_key = opts[:api_key]
    end

    def get(path, params = {})
      uri = encode_uri(path, params)
      timestamp = nonce
      content_hash = digest
      presign = timestamp.to_s + uri + 'GET' + content_hash

      resp = Faraday.get(uri) do |req|
        req.params = params
        # req.params['limit'] = 100
        req.headers['Api-Key'] = @api_key
        req.headers['Api-Timestamp'] = timestamp.to_s
        req.headers['Api-Content-Hash'] = content_hash
        req.headers['Api-Signature'] = sign(presign)
        req.headers['Content-Type'] = 'application/json'
        # req.body = body.to_json
      end

      JSON.parse(resp.body)
    end

    private

    def encode_uri(path, params)
      uri = API_URI + '/' + path
      uri = uri + '?' + URI.encode_www_form(params) if params.any?
      uri
    end

    def nonce
      (Time.now.to_f * 1000).to_i
    end

    def digest(body = nil)
      string =
        if body.is_a?(Hash)
          body.to_json
        elsif body.nil?
          ''
        end

      Digest::SHA512.hexdigest(string)
    end

    def sign(presign)
      OpenSSL::HMAC.hexdigest('sha512', @secret, presign)
    end
  end
end
