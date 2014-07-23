require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do 
		it "should have the content '矢上祭出展管理システム'" do 
			visit root_path
			expect(page).to have_content('矢上祭出展管理システム')
		end
	end

	describe "About page" do 
		it "should have the content '当システムについて'" do 
			visit about_path
			expect(page).to have_content('当システムについて')
		end
	end

end
