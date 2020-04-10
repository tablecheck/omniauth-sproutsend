require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Sproutsend < OmniAuth::Strategies::OAuth2
      option :name, 'sproutsend'
      option :redirect_uri

      uid { raw_info['userId'] }

      info do
        {
          name: raw_info['name'],
          username: raw_info['username'],
          email: raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('user').parsed
      end
    end
  end
end
