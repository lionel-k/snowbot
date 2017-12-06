require 'json'
require 'open-uri'

class FetchHomeAwayService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    base_url_search = 'https://ws.homeaway.com/public/search?'

    headers = {
      'Authorization' => ENV['HOMEAWAY_TOKEN'],
    }

    query_params = {
      minSleeps: @attributes[:guests_number],
      centerPointLongitude: @attributes[:domain].longitude,
      centerPointLatitude: @attributes[:domain].latitude,
      distanceInKm: '20',
      availabilityStart: @attributes[:checkin],
      availabilityEnd: @attributes[:checkout],
      reservation_en_ligne: 'Instant book',
      sort: 'prices:asc',
      currencyCode: 'EUR'
    }

    url = base_url_search + 'locale=fr'

    query_params.each do |k, v|
      url += '&' + k.to_s + '=' + v.to_s
    end

    listings_serialized = open(url, headers).read
    listings = JSON.parse(listings_serialized)
    available_flats = listings['entries']

    best_rated_available_flats = []
    available_flats.each do |flat|
      if flat['reviewAverage'].to_f >= 4 || flat['priceQuote']['averageNightly'] > 100
        best_rated_available_flats << flat
      end
    end

    flat = best_rated_available_flats.first
    return unless flat

    f = Flat.new(
      id_homeaway: flat['listingId'],
      location: flat['location']['city'],
      price_by_night: flat['priceQuote']['averageNightly'],
      ratings: flat['reviewAverage'],
      photo: flat['thumbnail']['secureUri']
    )
  end
end
