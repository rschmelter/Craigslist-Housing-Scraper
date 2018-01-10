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
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first
    a.css(".box").each do |box_info|
      box_info
      binding.pry
      if state == box_info.css("h4").text
        @state = box_info

      end
    end


  end
  #
  # def scrape_cities
  #   i = 0
  #
  # end


end
