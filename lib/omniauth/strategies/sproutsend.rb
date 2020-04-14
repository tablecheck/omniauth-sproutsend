require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Sproutsend < OmniAuth::Strategies::OAuth2
      WHITELABLE_TEMPLATE = 'https://{whitelabel}.api.contacta.io'.freeze

      option :redirect_uri
      option :whitelabel

      option :client_options, {
        authorize_url: '/oauth',
        token_url: '/oauth/token'
      }

      def initialize(app, *args, &block)
        if args.last.is_a?(Hash)
          whitelabel = args.last[:whitelabel]

          args.last[:client_options] ||= {}
          args.last[:client_options][:site] ||= WHITELABLE_TEMPLATE.gsub('{whitelabel}', whitelabel)
        end

        super
      end

      # uid { raw_info['userId'] }

      # info do
      #   {
      #     name: raw_info['name'],
      #     username: raw_info['username'],
      #     email: raw_info['email']
      #   }
      # end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('user').parsed
      end
    end
  end
end
