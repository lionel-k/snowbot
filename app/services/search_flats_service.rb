class SearchFlatsService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    flats = []

    @attributes[:domains].each do |domain|
      break if flats.size == 3

      service_homeaway = FetchHomeAwayService.new(
        checkin: @attributes[:checkin],
        checkout: @attributes[:checkout],
        guests_number: @attributes[:guests_number],
        domain: domain
      )

      flat = service_homeaway.call
      sleep 1
      next unless flat

      flat.domain = domain
      flats << flat
    end

    return flats
  end
end
