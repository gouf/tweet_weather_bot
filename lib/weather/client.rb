module Weather
  class Client
    # Init Mechanize and Twitter client
    def initialize(area)
      @scraper = ::Weather::Scraper.new(area.to_sym)
      @twitter = ::Weather::Twitter.new
    end

    def tweet
      weather = ::Weather.format(@scraper.weather)
      @twitter.tweet(weather)
    end

    def weather
      @scraper.weather
    end
  end
end
