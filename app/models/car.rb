class Car
  attr_accessor :id_drivy, :human_price, :car_title, :car_thumb_url

  def initialize(attributes = {})
    @id_drivy = attributes[:id_drivy]
    @price = attributes[:price]
    @title = attributes[:title]
    @photo = attributes[:photo]
  end
end
