class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user
  include JwtToken

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JwtToken.encode(user_id: @user.id)
      render json: {data: UserSerializer.new(@user), token: token}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
