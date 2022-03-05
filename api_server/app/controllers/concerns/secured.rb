module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    unless session[:company_id]
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  end
end
