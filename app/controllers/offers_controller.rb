require 'open-uri'
require 'json'


class OffersController < ApplicationController
  def index
    # 1. Search for cheapest cars on Drivy
    # 2. Update the weather conditions of all the domains
    # 3. Find the best domains from the input of the user
    # 4. For each of the best domains, find the cheapest flat
    # 5. From the cars and the flats, create a package which a list of 3 offers
    # search_cars(params[:la_query_1])
    @result = search_cars("Paris", "yes","12+Rue+du+Bac+Paris+France", "08%3A00","20%3A00", "2017-12-20","2017-12-22", 2000, "FR", "family")
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

  private
  def search_cars(city_start, instant_booking, location, checkin, checkout, date_start, date_end, distance_max, country, car_type)
    # return the cheapest cars found on Drivy
    # input: location of the user, checkin at 8:00, checkout 20:00, distance: 2000kms, family car, instant booking
    # output: 3 instances of object Car
    url_drivy = "https://www.drivy.com/search.json?instant_bookable=#{instant_booking}&address_source=google&start_time=#{checkin}&country_scope=#{country}&start_date=#{date_start}&latitude=&car_types%5B%5D=#{car_type}&longitude=&end_time=#{checkout}&end_date=#{date_end}&address=#{location}&distance=#{distance_max}&city_display_name=#{city_start}"
    @cars =JSON.parse(open(url_drivy).read)
  end
end
