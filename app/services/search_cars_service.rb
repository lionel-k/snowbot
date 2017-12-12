class SearchCarsService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    if @attributes[:start_city]
      start_city_maps_infos = Geocoder.search(@attributes[:start_city], :params => {:countrycodes => "fr"})
      start_city_latitude = start_city_maps_infos.first.data["geometry"]["location"]["lat"]
      start_city_longitude = start_city_maps_infos.first.data["geometry"]["location"]["lng"]
    else
      start_city_latitude = @attributes[:start_location]["lat"]
      start_city_longitude = @attributes[:start_location]["long"]
    end

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
