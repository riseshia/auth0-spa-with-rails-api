class PrivateController < ActionController::API
  include Secured

  def private
    render json: { message: 'private#private' }
  end

  def private_scoped
    render json: { message: 'private#private_scoped' }
  end
end
