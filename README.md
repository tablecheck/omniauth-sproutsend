# OmniAuth Sproutsend

This gem contains the Sproutsend OAuth2 Strategy for OmniAuth.

Supports the OAuth 2.0 Web Login. Read the sprout developers docs for more details: https://apidocs.sproutsend.com

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-sproutsend'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
# PROFILE permission required!!
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sproutsend, ENV['SPROUT_CLIENT_ID'], ENV['SPROUT_CLIENT_SECRET'],
    {
      whitelabel: ENV['SPROUT_WHITELABEL']
    }
end
```

Or you can set site with custom domain
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sproutsend, ENV['SPROUT_CLIENT_ID'], ENV['SPROUT_CLIENT_SECRET'],
    {
       client_options: {
         site: ENV['SPROUT_API_URL']
       }
    }
end
```

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  provider: "sproutsend",
  uid: "a123b4....",
  extra: {
    raw_info: {}
  }
}
```

## Supported Rubies

OmniAuth Sproutsend is tested under 2.1.x, 2.5.x.
