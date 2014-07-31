require 'spec_helper'

describe "EventinfoPages" do
  
	subject { page }

	describe "register page" do 
		before { visit register_eventinfo_path }

		it { expect(subject).to have_title('企画情報新規登録') }
		it { expect(subject).to have_content('企画情報新規登録') }
	end

end
