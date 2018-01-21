require 'open-uri'
require 'nokogiri'
require 'pry'

class HousingList::Scraper

  def make_states
    scrape_states
  end
  def make_cities
    scrape_states
    state_hash
    city_nodes
    city_arrays
    city_urls
    state_city_hash

  end
  def call
    scrape_states
    state_hash
    city_nodes
    city_arrays
    city_urls
    state_city_hash
    # zip_city_url
    # scrape_rental_block("https://bozeman.craigslist.org/")
    # scrape_rental_options
    # rental_options_href
    # scrape_housing_type_page("https://flagstaff.craigslist.org/d/apts-housing-for-rent/search/apa")
  end

  def scrape_states

    @states = []
    doc = Nokogiri::HTML(open('https://www.craigslist.org/about/sites'))
    a = doc.css(".colmask").first
      a.css(".box h4").each do |state|
        @states << state.text
      end
      @states
  end

  def state_hash
    @state_hash = {}
    @states.each do |state|
      @state_hash[state] = []
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

    def city_urls
      @city_urls = []
      i = 0
      @city_nodes.each do |group|
        @city_urls[i] = []
        group.css("li").each do |city|
          info = city.children
          url = info.attribute("href").value

          @city_urls[i] << url
        end
        i += 1
      end
      @city_urls
    end



    # def city_parser(node)
    #   @city_urls = []
    #   node.css("li").each do |city|
    #     info = city.children
    #     url = info.attribute("href").value
    #     @city_urls << url
    #   end
    #   @city_urls
    #
    # end


    def state_city_hash
      keys = @state_hash.keys
      i = 0
      keys.each do |state|
        @state_hash[state] << @city_arrays[i]
        @state_hash[state] << @city_urls[i]
        i += 1
      end
      @state_hash

    end



    def scrape_rental_block(url)
      @url = url
      html = open(url)
      doc = Nokogiri::HTML(html)
      @rental_block = doc.css(".housing ul").first
      @rental_block
    end


    def scrape_rental_options
      remove_at_index = [1, 2, 3, 4, 5, 7]
      @rental_options = []
      @rental_block.css("li").each do |type|
        @rental_options << type.text
      end
      @rental_options = @rental_options.reject.with_index do |e, i|
        remove_at_index.include?(i)
      end
      @rental_options

    end

    def rental_options_href
      @root = @url.chomp("/")
      @rental_urls = []
      i = 0
      remove_at_index = [1, 2, 3, 4, 5, 7]
      @rental_block.css("li").collect do |item|
        @rental_urls << item.children.attribute("href").value
    end
      @rental_urls.collect do |url|
        @rental_urls[i] = "#{@root}#{url}"
        i += 1
    end
      @rental_urls = @rental_urls.reject.with_index do |e, i|
        remove_at_index.include?(i)
    end
      @rental_urls

  end

  def scrape_housing_type_page(housing_type_url)
    @result_hash = {}
    i = 0
    html = open(housing_type_url)
    doc = Nokogiri::HTML(html)
    doc.css(".result-row .result-info").each do |result|
      size = result.css(".housing").text.split
      size.delete("-")
      size = size.join(" ")
      @result_hash[i] = result.css(".result-date").text, result.css(".result-title").text, result.css(".result-price").text, size, result.css(".result-hood").text
      i += 1
  end
  @result_hash

  # Going to have to deal with edge cases - delete empty strings
end


end
