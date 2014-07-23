require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do 
		it "should have the content '矢上祭出展管理システム'" do 
			visit '/static_pages/home'
			expect(page).to have_content('矢上祭出展管理システム')
		end
	end

	describe "About page" do 
		it "should have the content '当システムについて'" do 
			visit '/static_pages/about'
			expect(page).to have_content('当システムについて')
		end
	end

end
