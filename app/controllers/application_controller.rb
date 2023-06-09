class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

  include ActionView::Layouts
  include JwtToken

    # before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['token']
    header = header.split(' ').last if header
    begin
      @decoded = JwtToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
