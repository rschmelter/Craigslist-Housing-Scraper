require 'pry'

class HousingList::City
  attr_accessor :name, :state, :url

  @@all = []

  def self.make_cities(state)
    HousingList::Scraper.state_city_hash[state.to_sym][0].each do |city|
      self.new(city,
              state,
              )

  end

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


end
