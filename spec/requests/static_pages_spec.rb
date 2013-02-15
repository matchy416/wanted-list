require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "Home Page" do
		before { visit root_path}

		it "should contain important html elements" do
			should have_selector('h1', text: 'Wanted List')
			should have_selector('title', text: 'Wanted List')
		end
	end	
end
