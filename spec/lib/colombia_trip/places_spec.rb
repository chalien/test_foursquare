require "spec_helper"

describe ColombiaTrip::Places do

  describe "#around" do
    let(:strategy){ Object }
    let(:places){ described_class.new(strategy) }
    let(:city){ "barranquilla" }
    let(:place){ double("place", id: 1, name: "neverland", categories: []) }
    let(:params){ { city: city, lat_lon: nil}  }

    before do
      strategy.any_instance.stub(:places).with(params).and_return([place])
    end


    it{ places.around(city).should be_a_kind_of(Array)}
    it{ places.around(city).first.should be_a_kind_of(Struct)}
  end

  describe "#roulette" do
  end

end
