require 'spec_helper'

describe "StaticPages" do

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
