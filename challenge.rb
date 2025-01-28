require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_KEY"))

pp "Hello! How can I help you today?"
pp "-" * 50
user_request = gets
