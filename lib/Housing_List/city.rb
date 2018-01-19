require 'pry'

class HousingList::City
  attr_accessor :name, :state, :url

  def self.make_cities(state)
    HousingList::Scraper.new.make_cities[state].each do |array|
      self.new(array[i][i],
              state,
              array[i + 1][i]
              )
              i += 1
      end
    end

  @@all = []



  def initialize(name, state, url)
    @name = name
    @rentals = []
    state.add_city = self
    @@all << self
  end

  def self.all
    @@all
  end

  def add_rental(rental)
    @rentals << rental
    rental.city = self
  end

  def rentals
    @rentals
  end



binding.pry

end
