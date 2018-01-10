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
      states
    binding.pry
  end



end
