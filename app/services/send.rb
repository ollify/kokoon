class Send
  def initialize
  end

  def self.deliver


    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: 'You have been subscribed to a new ticket in your Kokoon account. Please go to http://www.kokoon.space/my_account to reply.',
         from: '+14435683642',
         to: '+351938528287'
       )
  end
end


