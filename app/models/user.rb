class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

    
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followees, through: :followed_users, dependent: :destroy
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :following_users, dependent: :destroy


  has_many :hotels
  has_many :reviews, dependent: :destroy

  has_many :restaurants 
  has_many :reviews, dependent: :destroy



  def self.generate_otp(user)
    @user = user
    @sms_otp =  SmsOtp.new(email: @user.email, user_id: @user.id, sms_otp: rand.to_s[2..7])
    @sms_otp.save
    message = "Welcome to the application you one time password id #{@sms_otp.sms_otp}"
    TwilioClient.new.send_sms(@user, message)
  end
end


  

# hotel has_many reviews
# hotel belongs_to user


# user has_many hotels
# user has_many reviews

# reviews belongs_to user
# reviews belongs_to hotels






