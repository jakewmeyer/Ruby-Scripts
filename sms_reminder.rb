# This is an app that send you a text reminder through SMS
# Using Twilio REST API and time class in ruby

require 'date'
require 'time'
require 'twilio-ruby'

# Method for sending the text
def text_messege(msg, pn_area)
    account_sid = 'Acount ID goes here'
    auth_token = 'API token goes here'

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
    from: '+123456789',
    to: pn_area,
    body: msg, 
    )
end

puts ""
puts "What time would you like the reminder?"
puts "Ex: 12:34pm"
print "-> "
user_time = gets
actual_time = Time.parse(user_time)

puts ""
puts "What number should I send it to?"
print "-> "
phone_number = gets.chomp
pn_area = "+1#{phone_number}"

puts ""
puts "What should the message say?"
print "-> "
msg = gets.chomp

# Logic and loop for sending
loop do
    current_time = Time.new
    if actual_time == current_time
        text_messege(msg, pn_area)
        puts "Your messege was sent!"
    end
end