require 'open-uri'
require 'nokogiri'
require 'pry'

class HousingList::Scraper

  def call
    # scrape_states
    # # state_hash
    # city_nodes
    # city_parser(@city_nodes[1])
    # city_arrays
    # state_city_hash
    scrape_rental_block("https://bozeman.craigslist.org/")
    scrape_rental_options

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
    @state_hash = {}
    scrape_states.each do |state|
      state_sym = state.to_sym
      @state_hash[state_sym] = []

      end
      @state_hash
    end

    def city_nodes
      @city_nodes = []
      doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
      a = doc.css(".colmask").first
      a.css(".box ul").each do |nodes|
        @city_nodes << nodes
      end
      @city_nodes
    end

    def city_arrays
      i = 0
      @text_array = []
      @city_arrays = []
      @city_nodes.collect do |node|
        @text_array << node.text
      end
      @text_array.collect do |cities|
        @city_arrays << cities.split("\n")
      end
      @city_arrays.collect do |array|
        array.pop
        array.shift
      end
      @city_arrays

    end


    def state_city_hash
      keys = @state_hash.keys
      i = 0
      keys.each do |state|
        @state_hash[state] << @city_arrays[i]
        i += 1
      end
      @state_hash

    end

    def city_parser(node)
      @city_urls = []
      node.css("li").each do |city|
        info = city.children
        url = info.attribute("href").value
        @city_urls << url
      end
      @city_urls

    end

    def scrape_rental_block(url)
      html = open(url)
      doc = Nokogiri::HTML(html)
      @rental_block = doc.css(".housing ul").first
    end

    def scrape_rental_options
      @rental_options = []
      @rental_options << @rental_block.css("li .apa").text
      @rental_options << @rental_block.css("li .roo").text
      @rental_options

    end


end
