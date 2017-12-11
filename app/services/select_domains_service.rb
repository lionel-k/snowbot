class SelectDomainsService
  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    Domain.
      where("snow_depth_low > ? AND mountain_chain = ?", "30", @attributes[:mountain_chain]).
      order(snow_depth_low: :desc)
  end
end
