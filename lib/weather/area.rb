# Refinements String class
module StringToJST
  refine String do
    def parse_in_jst
      regex = /(\d+)/
      match_pattern = scan(regex).to_a

      # In this case, string has always not pass value of seconds
      year, month, day, hour, min, sec = [match_pattern, '00'].flatten.map { |x| x.rjust(2, '0') }

      # DateTime.rfc3339('2001-02-03T04:05:06+07:00')
      DateTime.rfc3339("#{year}-#{month}-#{day}T#{hour}:#{min}:#{sec}+09:00")
    end
  end
end

module Weather
  module Area
    using StringToJST

    # List of available area
    URLS = {
      東京: '13/4410',
      横浜: '14/4610',
      那覇: '47/9110'
    }.freeze

    # Find weather information by XPath
    XPATHS = {
      today_weather:       '(//p[@class="pict"]/text())[1]',
      highest_temperature: '(//li[@class="high"]/em/text())[1]',
      lowest_temperature:  '(//li[@class="low"]/em/text())[1]',
      wash:                '//div[@class="expExpo"]/dl/dd[1]/text()',
      updated_at:          '(//p[@class="yjSt yjw_note_h2"]/text())[1]'
    }.freeze

    # Format XPath data
    FORMATTER = {
      today_weather:       proc { |x| x.to_s },
      updated_at:          proc { |x| x.to_s.parse_in_jst },
      highest_temperature: proc { |x| x.to_s },
      lowest_temperature:  proc { |x| x.to_s },
      wash:                proc { |x| x.to_s }
    }.freeze
  end
end
