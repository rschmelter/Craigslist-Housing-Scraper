require 'open-uri'
require 'nokogiri'
require 'pry'

class HousingList::Scraper

  def scrape_index
    states = []
    i = 0

    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))

    doc.css(".colmask .box h4").each do |state|
      states[i] = state.text
      i += 1

    end
    states
    binding.pry
  end

end
