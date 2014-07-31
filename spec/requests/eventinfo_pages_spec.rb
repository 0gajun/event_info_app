require 'spec_helper'

describe "EventinfoPages" do
  
	subject { page }

	let(:admin_user){ FactoryGirl.create(:admin) } 
	before do 
		sign_in admin_user
	end

	describe "register page" do 
		before { visit register_eventinfo_path }

		it { expect(subject).to have_title('企画情報新規登録') }
		it { expect(subject).to have_content('企画情報新規登録') }
	end

end
