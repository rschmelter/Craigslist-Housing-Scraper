require 'open-uri'
require 'nokogiri'
require 'pry'

class HousingList::Scraper


  def scrape_states
    i = 0
    states = []
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first
      a.css(".box h4").each do |state|
        states[i] = state.text
        i += 1
      end
      puts states

  end

  def scrape_cities(state)
    i = 1
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first

    a.css(".box ul").each do |cities|
        cities.text
      #   binding.pry
      #   if state == box_info.css("h4").text
      #   @state = box_info
      #
      # end
    end
  end

  def state_city_hash
    i = 0
    states = []
    state_city = {}
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first
      a.css(".box h4").each do |state|
        state_name = state.text
        states[i] = state_name
        # I'm trying to create state/city hashes by interating through the states first and then adding the cities as values in another method.
      i += 1
      end
      state_city
      binding.pry
  end

  # box_info.values returns box box_1
  #
  # def scrape_cities
  #   i = 0
  #
  # end


end
