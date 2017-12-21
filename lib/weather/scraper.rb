require 'mechanize'

module Weather
  # Fetch weather information from Yahoo!
  class Scraper
    BASE_URL = 'http://weather.yahoo.co.jp/weather/jp'.freeze

    # @return [String]
    attr_reader :area

    # Fetch weather information by specified area
    # @param area [String]
    # @return [String]
    def initialize(area)
      fail_if_key_not_found(area.to_sym)

      @mechanize =
        Mechanize.new.get(
          "#{BASE_URL}/#{::Weather::Area::URLS[area.downcase.to_sym]}.html"
        )
      @area = area
    end

    # Returns fetched weather information
    # @return [Hash]
    def weather
      hash = {}
      hash[:area] = @area.capitalize.to_s

      # XPATHS.keys.each do |key|
      Area::XPATHS.each_key do |key|
        xpath = Area::XPATHS[key]
        value = Area::FORMATTER[key].call(@mechanize.xpath(xpath))
        hash[key] = value
      end

      hash
    end

    # Refetch weather information
    # @return [Hash]
    def update
      @mechanize = Mechanize.new.get(Area::URLS[@area])
      weather
    end

    private

    def fail_if_key_not_found(area)
      return if Area::URLS.key?(area)

      puts "Error! Area Key Has Not Found: #{area.capitalize}"
      puts 'Available area:'

      Area::URLS.each_key do |key|
        puts "  * #{key.capitalize}"
      end

      raise 'Area Key Has Not Found'
    end
  end
end
