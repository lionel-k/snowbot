class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index

    @mountain_chain = params[:mountain_chain]
    @guests_number = params[:guests_number]
    @checkin = Date.parse(params[:checkin].first)
    @checkout = Date.parse(params[:checkout].first)
    @start_city = params[:start_city]

    @flats = search_flats(
      @mountain_chain,
      @checkin,
      @checkout,
      @guests_number
    )

    @cars = search_cars(@start_city)

    @offers = build_package
    @order = Order.new
  end

  def search_cars(address)
    results = Geocoder.search(address, :params => {:countrycodes => "fr"})
    latitude = results.first.data["geometry"]["location"]["lat"]
    longitude = results.first.data["geometry"]["location"]["lng"]
    checkin = "2017-12-28"
    checkout = "2017-12-31"
    search = FetchDrivySearch.new(
        checkin: checkin,
        checkout: checkout,
        address: address,
        latitude: latitude,
        longitude: longitude
      )
    cars = search.call
  end

  def search_flats(mountain_chain, checkin, checkout, guests_number)

    domains = Domain.where("snow_depth_low > ? AND mountain_chain = ?", "30", mountain_chain)
    return if domains.nil?
    flats = []
    i = 0
    until flats.length >= 3 || domains[i].nil?
      service = FetchHomeAwayService.new(
        checkin: checkin,
        checkout: checkout,
        guests_number: guests_number,
        domain: domains[i]
      )

      flat = service.call
      next unless flat

      flat.domain = domains[i]
      flats << flat
      i += 1
    end
    return flats
  end

  def build_package
    @diff_days = @checkout.mjd - @checkin.mjd
    offers = []
    @flats.each_with_index do |flat, index|
      offer = Offer.new(id: index, car: @cars[index], flat: @flats[index])
      offer.compute_total(@diff_days)
      offers << offer
    end
    return offers
  end
end
