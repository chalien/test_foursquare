module  ColombiaTrip
  def self.place_around(city, lat_lon=nil)
    places.around(city, lat_lon)
  end

  def self.places
    @places||= Places.new Strategies::Foursquare
  end
end
