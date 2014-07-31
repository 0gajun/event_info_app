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

	describe "create new EventInformation" do 
		before { visit register_eventinfo_path }
		let(:submit) { "作成" }
		describe "with invalid information" do 
			it "don't create an eventinfo" do 
				expect { click_button submit }.not_to change(EventInfo, :count)
			end
		end
		describe "with valid information" do 
			before do 
				fill_in "企画名",		with: "ジョジョ"
				select  "観る", 			from: "event_info_categoryid"
				select	"ステージ",		from: "event_info_placeid"
				fill_in	"場所(詳細)",		with: "ステージ"
				fill_in "説明文",		with: "カクカクシカジカな企画を云々かんぬん"
				select	"スタッフ",		from: "event_info_userid"
			end
			it "create an eventinfo" do 
				expect { click_button submit }.to change(EventInfo, :count).by(1)
			end
		end
	end

end
