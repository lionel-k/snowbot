require 'json'
require 'open-uri'

class FetchDrivySearch
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    base_url_search = 'https://www.drivy.com/search.json'

    query_params = {
      instant_bookable: "yes",
      address_source: 'google',
      start_time: '08:00',
      country_scope: 'FR',
      start_date: @attributes[:checkin],
      latitude: @attributes[:latitude],
      car_types: ["family"],
      longitude: @attributes[:longitude],
      end_time: '20:00',
      end_date: @attributes[:checkout],
      address: @attributes[:address],
      distance: '2000'
    }

    params = []
    query_params.each do |k, v|
      if v.is_a?(Array)
        v.each do |value|
          params << "#{k}[]=#{value}"
        end
      else
        params << "#{k}=#{v}"
      end
    end

    url_drivy = "#{base_url_search}?#{params.join("&")}"

    listings_serialized = open(url_drivy).read
    listings = JSON.parse(listings_serialized)
    available_cars = listings['cars']
    three_lowest_cars = available_cars.sort_by {|k| k['humanPrice'] }.first(3)

    three_lowest_cars_array = []
    three_lowest_cars.each do |car|
      three_lowest_cars_array << Car.new(
        id_drivy: car['id'],
        price: car['humanPrice'].delete('€').to_i,
        title: car['carTitle'],
        photo: car['carThumbUrl']
      )
    end
    return three_lowest_cars_array
  end
end
