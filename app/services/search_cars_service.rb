class SearchCarsService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    start_city_maps_infos = Geocoder.search(@attributes[:start_city], :params => {:countrycodes => "fr"})
    start_city_latitude = start_city_maps_infos.first.data["geometry"]["location"]["lat"]
    start_city_longitude = start_city_maps_infos.first.data["geometry"]["location"]["lng"]

    service_drivy = FetchDrivySearch.new(
      checkin: @attributes[:checkin],
      checkout: @attributes[:checkout],
      latitude: start_city_latitude,
      longitude: start_city_longitude,
      nb_cars: @attributes[:nb_cars]
    )

    cars = service_drivy.call

  end
end
