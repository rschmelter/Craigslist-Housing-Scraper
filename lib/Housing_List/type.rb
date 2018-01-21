class HousingList::Type
  attr_accessor :name, :url, :city

  @@all = []

  def initialize(name, city, url)
    @name = name
    @city = city
    @url = url
    city.add_rental_type(self)
    @rentals = []
    @@all << self
  end

  def add_rental(rental)
    @rentals << []
    rental.type = self
  end


end
