class Flat
  attr_accessor :bedrooms_nb, :location, :id_homeaway, :price_by_night, :photo, :domain, :title, :ratings

  def initialize(attributes = {})
    @location = attributes[:location]
    @id_homeaway = attributes[:id_homeaway]
    @price_by_night = attributes[:price_by_night]
    @photo = attributes[:photo]
    @domain = attributes[:domain]
    @ratings = attributes[:ratings]
    @title = attributes[:title]
    @bedrooms_nb = attributes[:bedrooms_nb]
  end
end
