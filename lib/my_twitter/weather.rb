module MyTwitterClient
  # Tweets weather information
  class Weather
    # Init Mechanize and Twitter client
    def initialize(area)
      @weather_client = MyMechanize::Weather.new(area.downcase.to_sym)
      @tweet_client = MyTwitterClient::Client.new
    end

    # Tweets fetched weather information
    def tweet
      weather = format(@weather_client.weather)
      @tweet_client.tweet(weather)
    end

    # Format weather information to human readble text
    # @param w [String]
    # @return [String]
    def format(w)
      <<-EOT.lines.map(&:strip).join("\n")
      地域 #{w[:area]}
      きょうの天気 #{w[:today_weather]}
      最高気温#{w[:highest_temperature]}℃
      最低気温#{w[:lowest_temperature]}℃
      更新日時 #{w[:updated_at]}
      EOT
    end
  end
end
