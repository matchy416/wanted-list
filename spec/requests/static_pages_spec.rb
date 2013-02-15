require 'spec_helper'

describe "StaticPages" do

	describe "Home Page" do
		before { visit '/'}

		it "should contain html" do
			page.should have_selector('h1', text: 'Wanted List')
			page.should have_selector('title', text: 'Wanted List')
		end
	end	
end
