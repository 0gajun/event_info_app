#encoding: utf-8
require 'spec_helper'

describe "UserPages" do
	subject { page }
  describe "User create page" do
  	before { visit create_user_path }
  	it { expect(subject).to have_content('ユーザ登録') }
  	it { expect(subject).to have_title(full_title('ユーザ登録')) }
  end

  describe "User my_page" do 
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit my_page_path }
  	it { expect(subject).to have_title(full_title('マイページ')) }
  end

  describe "create user" do 
  	before { visit create_user_path }
  	let(:submit) { "作成" }

  	describe "with invalid information" do 
  		it "don't create an user" do
	  		expect { click_button submit }.not_to change(User, :count)
	  	end
  	end

  	describe "with valid information" do 
  		before do 
  			fill_in "名前",				with: "矢上　二郎"
  			fill_in "メールアドレス",		with: "test@example.com"
  			fill_in "団体名",			with: "矢上祭実行委員会"
  			fill_in "パスワード",			with: "foobar"
  			fill_in "パスワード(確認)",	with: "foobar"
  		end
  		it "create an user" do 
  			expect { click_button submit }.to change(User, :count).by(1)
  		end
	end
  end
end
