Rails.application.routes.draw do
  resource :hello, only: :show

  get 'api/public' => 'public#public'
  get 'api/private' => 'private#private'
  get 'api/private-scoped' => 'private#private_scoped'

  get '/auth/auth0/callback', to: 'auth0#callback'
end
