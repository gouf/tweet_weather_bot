# require 'pry' # for debug
require_relative 'lib/weather'
require 'dotenv'

Dotenv.load

desc 'Get weather information from Yahoo! 天気'
task :weather do
  client = Weather::Client.new(ENV['WEATHER_AREA'])
  puts client.weather
end

desc 'Tweet weather information'
task :tweet_weather do
  client = Weather::Client.new(ENV['WEATHER_AREA'])
  client.tweet
end
