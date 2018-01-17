require 'pry'

class HousingList::City
  attr_accessor :name, :state

  @@all = []

  def initialize(name, state)
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
