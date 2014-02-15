require "spec_helper"
describe ColombiaTrip::Strategies::Foursquare do
  let(:client_id){ "CLIENTID"}
  let(:client_secret){ "CLIENTSECRET"}

  # TODO move to config or something else
  let(:api_version){ "20140130" }
  let(:client){ double("client") }

  before do
    ENV["API_CLIENT"]= client_id
    ENV["CLIENT_SECRET"] = client_secret
    described_class.any_instance.stub(:api_version).and_return(api_version)
    Foursquare2::Client.stub(:new).with({client_id: client_id, client_secret: client_secret, api_version: api_version, isFuzzed: true}) { client }
  end

  it "should init a foursqueare client initialize" do
    foursquare_strategy =  described_class.new
  end

  describe "#places" do
    let(:foursquare_strategy){ described_class.new }
    let(:place_params){ {lat_lon: nil, city: "barranquilla"}}
    let(:place){ double("place", first: "venues")}

    before do
      client.stub(:search_venues).and_return([place])
    end

    it{expect(foursquare_strategy.places(place_params)).to be_kind_of Array}
    it{expect(foursquare_strategy.places(place_params).first.first).to eql "venues"}
  end
end
