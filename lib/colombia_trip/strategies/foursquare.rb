module ColombiaTrip
  module Strategies
    class Foursquare

      def initialize
        @api_version = "20140130"
        @default_categories="4bf58dd8d48988d1e2941735,4bf58dd8d48988d161941735"
        @client = Foursquare2::Client.new(
          # :nocov:
          client_id: ENV["API_CLIENT"],
          client_secret: ENV["CLIENT_SECRET"],
          api_version: @api_version,
          isFuzzed: true
          # :nocov:
        )
      end

      def places(place_params)
        venues = @client.search_venues(
          # :nocov:
          ll: place_params[:lat_lon],
          near: place_params[:city],
          categoryId: @default_categories
          # :nocov:
        ).find_all{ |data| data.first == "venues"}
        venues || []
      end
    end
  end
end
