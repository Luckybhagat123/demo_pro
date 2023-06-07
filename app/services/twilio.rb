class TwilioClient
  attr_reader :client
  ACCOUNT_SID = "AC15266fd4efd8b7697128650fad738ec1"
  AUTH_TOKEN = "6722e841c6fa0c6cb81379a8c212b50b"
  FROM = "+15706762147"

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end


  def send_sms(user, message)
    @user = user
    @message = message
    message = @client.messages.create(
                             body: @message,
                             from: FROM,
                             to: "+#{@user.phone_number}"
                           )
  end
end