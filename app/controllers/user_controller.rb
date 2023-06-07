class UserController < ApplicationController
  before_action :authenticate_user, except: [:create, :birthday_details ,:index, :gen_pdf, :forget_password]
  before_action :find_user, only: [:follow, :unfollow, :block_follow_user, :blocked_followers_list]
  include JwtToken
  # require 'twilio.rb'
  def index
    @users = User.all
    render json: UserSerializer.new(@users), status: :ok
  end

  def show
    render json: UserSerializer.new(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {data: UserSerializer.new(@user)}, status: :created
    else
      render json: {error: @user.errors.full_messages}, status: :unauthorized
    end
  end

  def show_followers
    follower = @current_user&.followed_users&.where(is_blocked: false)
    following = @current_user&.following_users&.where(is_blocked: false)
    render json: {followers: UserSerializer.new(follower&.map{|x| x&.followee}), followings: UserSerializer.new(following&.map{|x| x&.follower})}   
  end


  def update
      byebug
    if @current_user.present?
      @current_user.update(user_params)
      render json: UserSerializer.new(@current_user), status: :ok
    else
      render json: {error: "Unable to update data due to wrong parameter or data"}, status: :unauthorized
    end
  end


  def follow
    if @current_user.id == @user.id
      return render json: {error: "you cannot follow yourself"}, status: :unprocessable_entity
    end
    follow = Follow.find_by(follower_id: @current_user.id, followee_id: @user.id)
    if follow.present?
      return render json: {error: "you are already following this user"}, status: :unprocessable_entity
    end
    @current_user.followees << @user
    render json: UserSerializer.new(@current_user.followees)
  end

  def unfollow
    @current_user.followed_users.find_by(followee_id: @user.id).destroy
    render json: {message: "Successfully unfollowed user"}
  end

  def block_follow_user
    block = @current_user.followed_users.find_by(followee_id: @user.id)
    if block.is_blocked == false 
      block.update(is_blocked: true) 
      render json: {message: "User blocked successfully"}
    else
      block.update(is_blocked: false)
      render json: {message: "User unblocked successfully"}
    end
  end

  def blocked_followers_list
    render json: {data: UserSerializer.new(@current_user.followed_users.where(is_blocked: true))}
  end


  # def verify_otp
  #   if @current_user.present? && @current_user&.sms_otp&.sms_otp == params[:sms_otp]
  #     byebug
  #     @current_user.update(activated: true)
  #     token = JwtToken.encode(user_id: @current_user.id)
  #     render json: {message: "Verification successfull", token: token}
  #   else
  #     render json: {error: "Invalid otp or email is not registered"}
  #   end
  # end

  # def forget_password
  #   user = User.find_by(email: params[:email])
  #   if user.present?
  #     User.generate_otp(@user)
  #     token = JwtToken.encode(user_id: user.id)
  #     render json: {message: "otp send successfully",token: token, otp: user.sms_otp.sms_otp}
  #   else
  #     render json: {error: "Email id not registered"}
  #   end
  # end

  # def reset_password
  #   if @current_user.present? && params[:password] == params[:password_confirmation]
  #     byebug
  #     @current_user.update(user_params)
  #     render json: {message: "Password updated successfully"}
  #   else
  #     render json: {error: "Account not present or password & password_confirmation is different"}
  #   end
  # end

  # def gen_pdf
  #   pdf = Prawn::Document.new
  #   pdf.image "app/assets/new.jpg", :at => [60,760], :width => 450
  #   pdf.image "app/assets/rrr.jpg", :at => [148,642], :width => 250 , :height => 335 
  #   send_data pdf.render, {filename: "neww.pdf", 
  #                          type: "application/pdf"
  #                        }
  # end

  # def birthday_details
  #   @user = User.where(dob: Date.today.to_s)
  #   if @user.present?
  #     render json: {data: UserSerializer.new(@user)}
  #   else
  #     render json: {message: "No one's birthady today"}
  #   end
  # end


  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation, :password_digest, :phone_number, :activated)
  end
end