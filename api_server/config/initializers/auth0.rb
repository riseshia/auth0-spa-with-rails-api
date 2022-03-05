# XXX: Allow init from frontend
OmniAuth.config.allowed_request_methods = [:get, :post]
OmniAuth.config.silence_get_warning = true

auth0_config = Rails.application.config_for(:auth0)

Rails.application.config.x.auth0 = auth0_config

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    auth0_config.auth0_client_id,
    auth0_config.auth0_client_secret,
    auth0_config.auth0_domain,
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'public'
    }
  )
end
