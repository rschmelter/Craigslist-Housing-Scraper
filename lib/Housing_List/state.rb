require 'pry'

class HousingList::State
  attr_accessor :name

  @@all = []
  def self.make_states
    HousingList::Scraper.scrape_states.each do |state|
      self.new(state)
  end


  def initialize(name)
    @name = name
    @cities = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_city(city)
    @cities << city
    city.state = self
  end

  def cities
    @cities
  end

  def rentals
    self.cities.collect do |city|
      city.rental
    end

  end





end
