require_relative 'lib/my_twitter/client'
require_relative 'lib/my_twitter/weather'
require_relative 'lib/my_mechanize/client'
require_relative 'lib/my_mechanize/weather'
require 'dotenv'

Dotenv.load

desc 'Get weather information from Yahoo! 天気'
task :weather do
  client = MyMechanize::Weather.new(ENV['WEATHER_AREA'])
  puts client.weather
end

desc 'Tweet weather information'
task :tweet_weather do
  client = MyTwitterClient::Weather.new(ENV['WEATHER_AREA'])
  client.tweet
end
