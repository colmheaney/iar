require 'spec_helper'

describe "StaticPages" do

	describe "home page" do
		it "should have the content 'IAR'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Home')
		end

		it "should have the right title" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => "Irish Archaeological Research | Home")
		end
	end

	describe "contact page" do
		it "should have the content 'Contact" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact Us')
		end

		it "should have the right title" do
			visit '/static_pages/contact'
			page.should have_selector('title', :text => "Irish Archaeological Research | Contact")
		end
	end

	describe "about page" do
		it "should have the content 'About" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About Us')
		end

		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title', :text => "Irish Archaeological Research | About")
		end
	end
end
