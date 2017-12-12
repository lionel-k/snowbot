class CreateOffersService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    checkin = @attributes[:checkin].first
    checkout = @attributes[:checkout].first
    # select domains
    domains_service = SelectDomainsService.new(mountain_chain: @attributes[:mountain_chain])

    domains = domains_service.call
    return [] if domains.empty?

    # search flats
    flats_service = SearchFlatsService.new(
      domains: domains,
      checkin: checkin,
      checkout: checkout,
      guests_number: @attributes[:guests_number]
    )

    flats = flats_service.call
    return [] if flats.empty?

    # search cars
    nb_cars = flats.length
    cars_service = SearchCarsService.new(
      start_city: @attributes[:start_city],
      start_location: @attributes[:start_location],
      checkin: checkin,
      checkout: checkout,
      nb_cars: nb_cars
    )

    cars = cars_service.call
    return [] if cars.empty?

    # return max 3 offers
    diff_days = Date.parse(checkout).mjd - Date.parse(checkin).mjd
    offers = []

    flats.each_with_index do |flat, index|
      car = cars[index]
      offer = Offer.new(
        user: @attributes[:user],
        domain: flat.domain,
        flat_id_homeaway: flat.id_homeaway,
        flat_title: flat.title,
        flat_photo: flat.photo,
        flat_price_by_night: flat.price_by_night,
        flat_ratings: flat.ratings,
        flat_location: flat.location,
        car_id_drivy: car.id_drivy,
        car_price: car.price,
        car_title: car.title,
        car_photo: car.photo
      )
      offer.total_price(diff_days)
      offer.save!
      offers << offer
    end

    return offers
  end
end
