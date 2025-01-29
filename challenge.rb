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

raw_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

pp raw_response

next_respons = p
