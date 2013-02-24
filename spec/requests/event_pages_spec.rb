require 'spec_helper'

describe "EventPages" do

	subject { page }

	describe "event page" do
		let(:event) { FactoryGirl.create(:event) }
		before { visit event_path(event) }

		it { should have_selector('h1', text: event.title) }
		it { should have_selector('title', text: event.title) }
	end

	describe "new event page" do
		
		let(:user) { FactoryGirl.create(:user) }
		let(:submit) { "Add new event" }

		before do
			sign_in user
			visit new_event_path 
		end

		it { should have_selector('h1', text: 'Add new event') }
		it { should have_selector('title', text: full_title('Add new event')) }

		describe "with invalid information" do
			it "should not create an event" do
				expect { click_button submit }.not_to change(Event, :count)	
			end
		end

		describe "with valid information" do
			before do
				fill_in "Title", with: "Example title"
				fill_in	"Description", with: "Example description"
				fill_in	"Location", with: "Example location"
			end

			it "should create an event" do
				expect{ click_button submit }.to change(Event, :count).by(1)
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		let(:event) { FactoryGirl.create(:event) }
		
		before do
			sign_in user			
			visit edit_event_path(event)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update event") }
			it { should have_selector('title', text: full_title('Update event')) }
		end

		describe "with invalid information" do
			before do 
				fill_in "Title", with: " "
				click_button "Save changes" 
			end

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_title) { "New title" }
			let(:new_description) { "New description" }
			let(:new_location) { "New location" }
			before do
				fill_in "Title", with: new_title
				fill_in "Description", with: new_description
				fill_in "Location",	with: new_location
				click_button "Save changes"
			end

			it { should have_selector('title', text: new_title) }
			it { should have_selector('div.alert.alert-success') }
			specify { event.reload.title.should == new_title }
			specify { event.reload.description.should == new_description }
			specify { event.reload.location.should == new_location }
		end
	end

	describe "index" do
		
		let(:event) { FactoryGirl.create(:event) }

		before(:each) do
			visit events_path
		end

		it { should have_selector('title', text: 'News/Events') }
		it { should have_selector('h1', text: 'News/Events') }

		describe "pagination" do
			
			before(:all) { 20.times {FactoryGirl.create(:event) } }
			after(:all) { Event.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each event" do
				Event.paginate(page: 1).each do |event|
					page.should have_selector('li', text: event.title)
				end
			end
		end
	end
end
