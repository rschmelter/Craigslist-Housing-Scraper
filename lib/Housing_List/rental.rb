require 'pry'

class HousingList::Rental
  attr_accessor :type, :list_date, :list_number, :description, :price, :size, :area

  @@all = []

  def initialize(type, list_number)
    @type = type
    @list_number = list_number
    @@all << self
    type.add_rental(self)
  end

  def self.all
    @@all
  end

  def list_date
    @list_date
  end

  def description
    @description
  end

  def price
    @price
  end

  def size
    @size
  end

  def area
    @area
  end

end
