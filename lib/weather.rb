module Weather
  require_relative './weather/area'
  require_relative './weather/client'
  require_relative './weather/scraper'
  require_relative './weather/twitter'

  class << self
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
