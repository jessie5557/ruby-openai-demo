require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_KEY"))

pp "Hello! How can I help you today?"
pp "-" * 50
user_request = gets

# Prepare an Array of previous messages
message_list = [
  {:role => "system",:content => "You are a helpful assistant."},
  {:role => "user",:content => user_request}
  ]  

if user_request == "bye"
  pp "bye"
else
  # Call the API to get the next message from GPT
  raw_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    }
  )
  
  next_message = raw_response.fetch("choices").at(0).fetch("message").fetch("content")
  message_list.push(next_message)
  pp next_message

  pp "Hello! How can I help you today?"
  pp "-" * 50
  user_request = gets
end
