require "rubygems"

@twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['YNB1bhMpex4y7ERRuCe8hqCA3']
  config.consumer_secret = ENV['3QezXzBngsbxZgIdJiGXxjZomXFrXLLgULWT8MoFwSDvAJPJcr']
  config.access_token = ENV['2285360612-IYtenRkqB5FYSzUkeElInRRLfvbio8pvkoRASu7']
  config.access_token_secret = ENV['IfyCV2Ltiw2xQajJcymuu7QIhSOMhB1kL2x63MSMQTTzX']
end