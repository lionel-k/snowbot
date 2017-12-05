require 'open-uri'
require 'json'


class OffersController < ApplicationController
  def index
    # 1. Search for cheapest cars on Drivy
    # 2. Update the weather conditions of all the domains
    # 3. Find the best domains from the input of the user
    # 4. For each of the best domains, find the cheapest flat
    # 5. From the cars and the flats, create a package which a list of 3 offers
    search_cars
  end


  def update_weather_conditions
    # https://www.skiinfo.fr/france/bulletin-neige.html
    # Scrape the skiinfo website
    # for each domain, update domain.is_sunny, domain.snow_depth_low and domain.snow_depth_high
  end

  def best_domains
    # return y domains where snow_depth_low > x
  end

  def search_flats
    # for all best domains, find the cheapest flat using the homeaway API
    # input: AvailabilityStart, AvailabilityEnd, distanceInKm, lat/lng of the domain, minBedrooms
    # output: 3 instances of object Flat
    FetchHomeAwayService.new(lo)
  end

  def build_package
    # With a given set of cars and flats, return an array of [car, flat]
  end

  def search_cars
    # return the cheapest cars found on Drivy
    # input: location of the user, checkin at 8:00, checkout 20:00, distance: 2000kms, family car, instant booking
    # output: 3 instances of object Car
    FetchDrivySearch.new(lo)
  end
end
