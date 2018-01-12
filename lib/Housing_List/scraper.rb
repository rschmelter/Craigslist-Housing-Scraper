require 'open-uri'
require 'nokogiri'
require 'pry'

class HousingList::Scraper

  def call
    scrape_states
    state_hash
    state_city_hash
  end

  def scrape_states
    i = 0
    states = []
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first
      a.css(".box h4").each do |state|
        states[i] = state.text
        i += 1
      end
      states
  end

  def state_hash
    @state_city = {}
    scrape_states.each do |state|
      state_sym = state.to_sym
      @state_city[state_sym] = nil

      end
      @state_city
    end

    def state_city_hash
      i = 0
      keys = @state_city.keys
      doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
      a = doc.css(".colmask").first
      a.css(".box ul").each do |cities|
        @state_city[keys[i]] = [cities.text]
        i += 1
        binding.pry
      end
      @state_city

# Need to parse the cities so that they are seperate items in an array instead of just one.

    end



  # def state_city_hash
  #   @state_city = {}
  #   doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
  #   a = doc.css(".colmask").first
  #     a.css(".box h4").each do |state|
  #       state_string = state.text.to_sym
  #       @state_city[state_string] = nil
  #
  #     end
  #     a.css (".box h4 li").each do |city|
  #       @state
  #     @state_city
  #     binding.pry
  #
  #   end



end
