class PublicController < ApplicationController
  def public
    render json: { message: 'public#public' }
  end
end
