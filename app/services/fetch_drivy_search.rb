require 'json'
require 'open-uri'
require 'pry-byebug'
require_relative '../../app/models/car.rb'

class FetchDrivySearch

  def initialize( attributes = {
  checkin: checkin,
  checkout: checkout,
  location: location,
  address: address
  })

    base_url_search = 'https://www.drivy.com/search.json?'

    query_params = {
      address_source: 'google',
      start_time: '08%3A00',
      country_scope: 'FR',
      start_date: attributes[:checkin],
      latitude: attributes[:address].latitude,
      car_types: 'family',
      ## il manque %5B%5D
      longitude: attributes[:address].longitude,
      end_time: '20%3A00',
      end_date: attributes[:checkout],
      address: attributes[:address],
      distance: '4000',
      city_display_name: attributes[:location]
    }

    url_drivy = base_url_search + 'instant_bookable=yes'

    query_params.each do |k, v|
      url_drivy += '&' + k.to_s + '=' + v
    end

    listings_serialized = open(url_drivy).read
    listings = JSON.parse(listings_serialized)
    available_cars = listings['cars']

    best_rated_available_cars = []
    available_cars.each do |car|
      if car['humanPrice'].to_f < 200
        best_rated_available_cars << car
      end
    end

    car = best_rated_available_cars[0]

    returned_car = Car.new(
      id_drivy: car['id'],
      price: car['humanPrice'],
      title: car['carTitle'],
      photo: car['carThumbUrl']
    )

    returned_car

  end
end
