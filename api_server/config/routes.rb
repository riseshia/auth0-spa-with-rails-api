Rails.application.routes.draw do
  resource :hello, only: :show
end
