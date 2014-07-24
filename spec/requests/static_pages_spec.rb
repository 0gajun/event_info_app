require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do 
		it "should have the content '矢上祭出展管理システム'" do 
			visit root_path
			expect(page).to have_title(full_title(''))
		end
	end

	describe "About page" do 
		before { visit about_path }
		it "should have the content '当システムについて'" do 
			expect(page).to have_content('当システムについて')
		end
		it "should have the title '当システムについて'" do 
			expect(page).to have_title(full_title('当システムについて'))
		end
	end

end
