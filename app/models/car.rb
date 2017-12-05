class Car
  attr_accessor :id_drivy, :price, :title, :photo

  def initialize(attributes = {})
    @id_drivy = attributes[:id_drivy]
    @price = attributes[:price]
    @title = attributes[:title]
    @photo = attributes[:photo]
  end
end
