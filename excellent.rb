require 'twitter'
require 'dotenv'
Dotenv.load

twitter_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['TOKEN'] 
  config.access_token_secret = ENV['TOKEN_SECRET']
end

topics = ["ftw", "epic", "zdaemon"]
twitter_stream.filter(:track => topics.join(",")) do |tweet|
  puts tweet.text
end