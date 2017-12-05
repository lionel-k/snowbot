class Offer
  attr_accessor :car, :flat, :domain

  def initialize(attributes = {})
    @car = attributes[:car]
    @flat = attributes[:flat]
    @domain = attributes[:domain]
  end
end
