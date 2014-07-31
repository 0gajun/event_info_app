require 'spec_helper'

describe Place do
  before { @place = Place.new(name: "場所") }

  subject { @place }

  it { expect(subject).to respond_to(:name) }

  describe "when name is not present" do 
  	before { @place.name = " " }
  	it { expect(subject).not_to be_valid }
  end

end
