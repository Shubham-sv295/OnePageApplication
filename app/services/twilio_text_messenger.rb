class TwilioTextMessenger
  attr_reader :message

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: "+12108995679",
      to: '+919685080084',
      body: "message from ticket management"
    })
  end
end