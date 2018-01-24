require 'pry'

class HousingList::State
  attr_accessor :name

  @@all = []



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

  def types
    self.cities.collect do |city|
      city.type
    end
  end

  def rentals
    self.cities.types.collect do |type|
      type.rental
  end

  end

  def self.find_by_name(state)
    @@all.detect do |state|
      state.name = state
    end
  end




end
