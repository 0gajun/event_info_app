require 'spec_helper'

describe Subplace do
	before { @subplace = Subplace.new(name: "場所") }

	subject { @subplace }

	it { expect(subject).to respond_to(:name) }

	describe "when name is not present" do 
  		before { @subplace.name = " " }
  		it { expect(subject).not_to be_valid }
	end
end
