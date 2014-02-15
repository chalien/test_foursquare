module ColombiaTrip
  class Places
    Place = Struct.new :id, :name, :categories

    def initialize(strategy)
      @strategy = strategy.new
    end

    def around(city, lat_lon= nil)
      parse_raw_places @strategy.places({city: city, lat_lon: lat_lon})
    end

    private
    def parse_raw_places(raw_places)
      raw_places.map do |raw_place|
        Place.new(raw_place.id, raw_place.name, raw_place.categories)
      end
    end
  end
end
