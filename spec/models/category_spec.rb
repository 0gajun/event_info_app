require 'spec_helper'

describe Category do
   	before { @category = Category.new(name: "カテゴリー") }

	subject { @category }

  	it { expect(subject).to respond_to(:name) }

  	describe "when name is not present" do 
  		before { @category.name = " " }
  		it { expect(subject).not_to be_valid }
  	end
end
