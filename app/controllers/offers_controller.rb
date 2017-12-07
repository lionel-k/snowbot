# require_relative "../../app/services/fetch_homeaway_service.rb"

class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # 1. Search for cheapest cars on Drivy
    @cars = search_cars(params[:start_city])
    # 2. Update the weather conditions of all the domains
    # 3. Find the best domains from the input of the user
    # 4. For each of the best domains, find the cheapest flat
    @flats = search_flats(params[:mountain_chain], params[:checkin].first, params[:checkout].first, params[:guests_number])
    # 5. From the cars and the flats, create a package which a list of 3 offers
    @offers = build_package
    @order = Order.new
  end

  def search_cars(address)
    # return the cheapest cars found on Drivy
    # input: location of the user, checkin at 8:00, checkout 20:00, distance: 2000kms, family car, instant booking
    # output: 3 instances of object Car
    results = Geocoder.search(address, :params => {:countrycodes => "fr"})
    latitude = results.first.data["geometry"]["location"]["lat"]
    longitude = results.first.data["geometry"]["location"]["lng"]
    checkin = "2017-12-28"
    checkout = "2017-12-31"
    @cars = []
    search = FetchDrivySearch.new(
        checkin: checkin,
        checkout: checkout,
        address: address,
        latitude: latitude,
        longitude: longitude
      )
    @cars = search.call

  end

  def update_weather_conditions
    # https://www.skiinfo.fr/france/bulletin-neige.html
    # Scrape the skiinfo website
    # for each domain, update domain.is_sunny, domain.snow_depth_low and domain.snow_depth_high
  end

  def find_best_domains(mountain_chain)
    # return y domains where snow_depth_low > x
    Domain.where("snow_depth_low > ? AND mountain_chain = ?", "30", mountain_chain).sample(3)
  end

  def search_flats(mountain_chain, checkin, checkout, guests_number)
    # for all best domains, find the cheapest flat using the homeaway API
    # input: AvailabilityStart, AvailabilityEnd, distanceInKm, lat/lng of the domain, minBedrooms
    # output: 3 instances of object Flat
    best_domains = find_best_domains(mountain_chain)

    flats = []
    best_domains.each do |domain|
      service = FetchHomeAwayService.new(
        checkin: checkin,
        checkout: checkout,
        guests_number: guests_number,
        domain: domain
      )

      flat = service.call
      next unless flat

      flat.domain = domain

      flats << flat
    end
    return flats

  end

  def build_package
    # With a given set of cars and flats, return an array of [car, flat]
    offer_1 = Offer.new(id: 1, car: @cars[0], flat: @flats[0])
    offer_2 = Offer.new(id: 2, car: @cars[1], flat: @flats[1])
    # offer_3 = Offer.new(id: 3, car: @cars[2], flat: @flats[2])
    [offer_1, offer_2]
  end
end
