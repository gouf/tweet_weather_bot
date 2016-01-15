require 'mechanize'

module MyMechanize
  class Client
    attr_reader :page

    def initialize(url)
      @client = Mechanize.new
      get(url)
    end

    def get(url)
      @page = @client.get(url)
    end
  end
end
