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
end
