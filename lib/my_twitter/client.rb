require 'twitter'
require 'dotenv'

module MyTwitterClient
  # Tweet some text to own account
  class Client
    # it needs some environment vatiable for tweet
    # @return Twitter::REST::Client
    # @see https://github.com/sferik/twitter/blob/master/examples%2FConfiguration.md
    def initialize
      Dotenv.load # effects only development environment
      @client = Twitter::REST::Client.new(
        consumer_key:        ENV['TWITTER_CONSUMER_KEY'],
        consumer_secret:     ENV['TWITTER_CONSUMER_SECRET'],
        access_token:        ENV['TWITTER_ACCESS_TOKEN'],
        access_token_secret: ENV['TWITTER_ACCESS_TOKEN_SECRET']
      )
    end

    # @param tweet_text [String] tweet text
    def tweet(tweet_text)
      @client.update(tweet_text)
    rescue Twitter::Error::TooManyRequests => error
      seconds = error.rate_limit.reset_in
      sleep_until_possible_to_tweet(seconds)
    end

    private

    def sleep_until_possible_to_tweet(seconds)
      sleep(seconds + 1)
    end
  end
end
