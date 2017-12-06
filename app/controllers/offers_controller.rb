# require_relative "../../app/services/fetch_homeaway_service.rb"

class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # 1. Search for cheapest cars on Drivy
    search_cars
    # 2. Update the weather conditions of all the domains
    # 3. Find the best domains from the input of the user
    # 4. For each of the best domains, find the cheapest flat
    search_flats
    # 5. From the cars and the flats, create a package which a list of 3 offers
    @offers = build_package
    @order = Order.new
  end

  def search_cars
    # return the cheapest cars found on Drivy
    # input: location of the user, checkin at 8:00, checkout 20:00, distance: 2000kms, family car, instant booking
    # output: 3 instances of object Car
    # car_1 = Car.new(id_drivy: 1111, price: 350, title: "Fiat 500", photo: "https://www.fiat.co.uk/content/dam/fiat/cross/models/500_family/500/external/secondskin/comics-Rossa.jpg")
    # car_2 = Car.new(id_drivy: 2222, price: 450, title: "BMW Serie A", photo: "http://cloudlakes.com/data_images/models/bmw-1/bmw-1-02.jpg")
    # car_3 = Car.new(id_drivy: 3333, price: 550, title: "Peugeot 506", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLtIbhO-iU4WnsUVcoUaW9nAR_DXniTpqUSHKQsfn1NsV7Pk48")
    # return [car_1, car_2, car_3]

    address = "12 rue du petit Bac Paris"
    checkin = "2017-12-28"
    checkout = "2017-12-31"
    location = "Paris"
    @cars = []

    search = FetchDrivySearch.new(
        checkin: checkin,
        checkout: checkout,
        guests_number: guests_number,
        domain: domain
      )

    @cars = search.call
    end



  end

  def update_weather_conditions
    # https://www.skiinfo.fr/france/bulletin-neige.html
    # Scrape the skiinfo website
    # for each domain, update domain.is_sunny, domain.snow_depth_low and domain.snow_depth_high
  end

  def find_best_domains
    # return y domains where snow_depth_low > x
    Domain.where("snow_depth_high > 100").order("snow_depth_high asc").first(3)
  end

  def search_flats
    # for all best domains, find the cheapest flat using the homeaway API
    # input: AvailabilityStart, AvailabilityEnd, distanceInKm, lat/lng of the domain, minBedrooms
    # output: 3 instances of object Flat
    best_domains = find_best_domains
    checkin = "2017-12-28"
    checkout = "2017-12-31"
    guests_number = 3
    @flats = []
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

      @flats << flat
    end

    # flat_1 = Flat.new(location: "16 rue de la neige #{best_domains[0].name}",
    #   id_homeaway: 1111,
    #   price_by_night: 123,
    #   photo: "http://blog.paradizo.com/wp-content/uploads/2010/10/purple-ski-chalets.jpg",
    #   domain: best_domains[0],
    #   ratings: 4)

    # flat_2 = Flat.new(location: "16 rue de la neige #{best_domains[1].name}",
    #   id_homeaway: 222,
    #   price_by_night: 222,
    #   photo: "https://www.meribel-chalets-apartments.com/uploads/small/Meribel_Chalet_and_Apartment_rentals_-_homepage_1.jpg",
    #   domain: best_domains[1],
    #   ratings: 3)

    # flat_3 = Flat.new(location: "16 rue de la neige #{best_domains[2].name}",
    #   id_homeaway: 333,
    #   price_by_night: 333,
    #   photo: "https://www.consensiochalets.co.uk/wp-content/uploads/2016/08/Mont-Tremblant--960x540.jpg",
    #   domain: best_domains[2],
    #   ratings: 5)

    # @flats = [flat_1, flat_2, flat_3]
  end

  def build_package
    # With a given set of cars and flats, return an array of [car, flat]
    offer_1 = Offer.new(id: 1, car: @cars[0], flat: @flats[0])
    offer_2 = Offer.new(id: 2, car: @cars[1], flat: @flats[1])
    # offer_3 = Offer.new(id: 3, car: @cars[2], flat: @flats[2])
    [offer_1, offer_2]
  end
end
