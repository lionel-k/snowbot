class Offer
  attr_accessor :id, :car, :flat, :domain, :total_price

  def initialize(attributes = {})
    @id = attributes[:id]
    @car = attributes[:car]
    @flat = attributes[:flat]
    @domain = attributes[:domain]
    # @total_price = attributes[:total_price]
  end

  def compute_total(days)
    @total_price = @car.price + (@flat.price_by_night * days)
  end
end
