require "spec_helper"

describe ColombiaTrip do
  let(:city){ "Barranquilla" }
  let(:places){ double("places") }
  describe ".place_arounf" do
    before do
      ColombiaTrip.stub(:places).and_return(places)
      places.stub(:around).and_return Array.new
    end

    it{ expect(ColombiaTrip.place_around(city)).to be_kind_of Array }
  end

  describe ".places" do
    before{ described_class::Strategies::Foursquare.stub(:new){ double("foursquare") }}
    it { expect(described_class.places).to be_kind_of ColombiaTrip::Places }
  end
end
