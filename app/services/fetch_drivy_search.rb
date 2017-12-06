require 'json'
require 'open-uri'

class FetchDrivySearch
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    base_url_search = 'https://www.drivy.com/search.json?'

    query_params_1 = {
      address_source: 'google',
      start_time: '08:00',
      country_scope: 'FR',
      start_date: @attributes[:checkin]
      #latitude: @attributes[:address].latitude
    }

    query_params_2 = {
      #longitude: @attributes[:address].longitude,
      end_time: '20:00',
      end_date: @attributes[:checkout],
      address: @attributes[:address],
      distance: '2000'
    }

    url_drivy = base_url_search + 'instant_bookable=yes'
    query_params_1.each do |k, v|
      url_drivy += '&' + k.to_s + '=' + v.to_s
    end
    url_drivy += '&' + 'car_types[]=family'
    query_params_2.each do |k, v|
      url_drivy += '&' + k.to_s + '=' + v.to_s
    end

    listings_serialized = open(url_drivy).read
    listings = JSON.parse(listings_serialized)
    available_cars = listings['cars']
    three_lowest_cars = available_cars.sort_by {|k| k['humanPrice'] }.first(3)

    three_lowest_cars.each do |car|
      Car.new(
        id_drivy: car['id'],
        price: car['humanPrice'],
        title: car['carTitle'],
        photo: car['carThumbUrl']
      )
    end
  end
end
