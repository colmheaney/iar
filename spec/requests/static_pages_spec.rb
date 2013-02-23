require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "home page" do
		before { visit root_path }

		it { should have_selector('h1', text: 'Welcome to IAR') }
		it { should have_selector('title', text: full_title('')) }
		it { should_not have_selector('title', text: '| Home') }
	end

	describe "contact page" do
		before { visit contact_path }

		it { should have_selector('h1', text: 'Contact Us') }
		it { should have_selector('title', text: full_title('Contact Us')) }
	end

	describe "about page" do
		before { visit about_path }

		it { should have_selector('h1', text: 'About Us') }
		it { should have_selector('title', text: full_title('About Us')) }
	end
end
