require 'pry'

class HousingList::Rental
  attr_accessor :type, :list_number :list_date, :description, :price, :size, :area, :url, :city

  @@all = []

  def initialize(type = nil, list_number = nil)
    @type = type
    @list_number = list_number
    @@all << self
    city.add_rental(self)
  end

  self.all
    @@all
  end

  def get_rental_info(url)
    @info = Scraper.new.scrape_housing_type_page(url)
    @list_date = @info[@list_number][0]
    @description = @info[@list_number][1]
    @price = @info[@list_number][2]
    @size = @info[@list_number][3]
    @area = @info[@list_number][4]
    @url = @info[@list_number][5]
  end

end
