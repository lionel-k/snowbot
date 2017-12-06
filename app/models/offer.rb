class Offer
  attr_accessor :id, :car, :flat, :domain

  def initialize(attributes = {})
    @id = attributes[:id]
    @car = attributes[:car]
    @flat = attributes[:flat]
    @domain = attributes[:domain]
  end
end
