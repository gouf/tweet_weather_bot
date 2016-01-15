module MyTwitterClient
  class Weather
    def initialize(area)
      @weather_client = MyMechanize::Weather.new(area.downcase.to_sym)
      @tweet_client = MyTwitterClient::Client.new
    end

    def tweet
      weather = format(@weather_client.weather)
      @tweet_client.tweet(weather)
    end

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
