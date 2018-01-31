require 'json'
require 'open-uri'

class FetchHomeAwayService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call

    base_url_search = 'https://ws.homeaway.com/public/search'

    headers = {
      'Authorization' => ENV['HOMEAWAY_TOKEN'],
    }

    query_params = {
      locale: 'fr',
      minSleeps: @attributes[:guests_number],
      centerPointLongitude: @attributes[:domain].longitude,
      centerPointLatitude: @attributes[:domain].latitude,
      distanceInKm: '1',
      availabilityStart: @attributes[:checkin],
      availabilityEnd: @attributes[:checkout],
      reservation_en_ligne: 'Instant book',
      sort: 'prices:asc',
      currencyCode: 'EUR',
      imageSize: 'MEDIUM'
    }

    params = []
    query_params.each do |k, v|
      params << "#{k}=#{v}"
    end

    url_homeaway = "#{base_url_search}?#{params.join("&")}"

    listings_serialized = open(url_homeaway, headers).read
    listings = JSON.parse(listings_serialized)
    available_flats = listings['entries']

    best_rated_available_flats = []
    available_flats.each do |flat|
      if flat['reviewAverage'].to_f >= 4 && flat['priceQuote']['averageNightly'] > 150
        best_rated_available_flats << flat
      end
    end

    flat = best_rated_available_flats.first
    return unless flat
    Flat.new(
      id_homeaway: flat['listingId'],
      location: flat['location']['city'],
      price_by_night: flat['priceQuote']['averageNightly'].to_f.ceil,
      ratings: flat['reviewAverage'],
      photo: image_tag('flat-les-arcs.jpg'),
      title: flat['headline'],
      bedrooms_nb: flat['bedrooms']

    )
  end
end
