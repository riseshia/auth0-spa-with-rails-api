require 'auth0'

module Auth0ManagementApi
  module_function

  def client
    @auth0_client ||= Auth0Client.new(
      client_id: ENV['AUTH0_CLIENT_ID'],
      client_secret: ENV['AUTH0_CLIENT_SECRET'],
      # If you pass in a client_secret value, the SDK will automatically try to get a
      # Management API token for this application. Make sure your Application can make a
      # Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types
      # tab) and that the Application is authorized for the Management API:
      # https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard
      #
      # Otherwise, you can pass in a Management API token directly for testing or temporary
      # access using the key below.
      # token: ENV['AUTH0_RUBY_API_TOKEN'],
      #
      # When passing a token, you can also specify when the token expires in seconds from epoch. Otherwise, expiry is set
      # by default to an hour from now.
      # token_expires_at: Time.now.to_i + 86400,
      domain: ENV['AUTH0_DOMAIN'],
      api_version: 2,
      timeout: 15 # optional, defaults to 10
    )
  end
end
