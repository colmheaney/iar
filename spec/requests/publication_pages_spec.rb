require 'spec_helper'

describe "PublicationPages" do

	subject { page }

	describe "new publication page" do
		
		let(:user) { FactoryGirl.create(:user) }
		let(:submit) { "Add new publication" }

		before do
			sign_in user
			visit new_publication_path 
		end

		it { should have_selector('h1', text: 'Add new Publication') }
		it { should have_selector('title', text: full_title('Add new Publication')) }

		describe "with invalid information" do
			it "should not create a Publication" do
				expect { click_button submit }.not_to change(Publication, :count)	
			end
		end

		describe "with valid information" do
			before do
				fill_in "Title", with: "Example title"
				fill_in	"Description", with: "Example description"
				attach_file "Choose Image:", "/home/ubuntu/rails_projects/iar/spec/fixtures/images/example.jpg"
				attach_file "Choose File:", "/home/ubuntu/rails_projects/iar/spec/fixtures/files/example.txt"
			end

			it "should create a publication" do
				expect{ click_button submit }.to change(Publication, :count).by(1)
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		let(:publication) { FactoryGirl.create(:publication) }
		
		before do
			sign_in user			
			visit edit_publication_path(publication)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update publication") }
			it { should have_selector('title', text: full_title('Update publication')) }
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
			before do
				fill_in "Title", with: new_title
				fill_in "Description", with: new_description
				click_button "Save changes"
			end

			it { should have_content(new_title) }
			it { should have_selector('div.alert.alert-success') }
			specify { publication.reload.title.should == new_title }
			specify { publication.reload.description.should == new_description }
		end
	end

	describe "index" do

		before(:each) do
			visit publications_path
		end

		it { should have_selector('title', text: 'Publications') }
		it { should have_selector('h1', text: 'Publications') }

		describe "pagination" do
			
			before(:all) { 20.times {FactoryGirl.create(:publication) } }
			after(:all) { Publication.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each publication" do
				Publication.paginate(page: 1).each do |publication|
					page.should have_selector('li', text: publication.title)
				end
			end
		end
	end

	describe "delete publication" do
		
		before { FactoryGirl.create(:publication) }
		let(:user) { FactoryGirl.create(:user) }

		describe "as signed in user" do
			before do 
				sign_in user
				visit publications_path
			end
			
			it "should delete a publication" do
				expect { click_link 'delete' }.to change(Publication, :count).by(-1)
			end
		end
	end

	# describe "download publication" do
	# 	before do 
	# 		FactoryGirl.create(:publication) 
	# 		visit publications_path
	# 		click_link 'download'
	# 	end

	# 	it "should generate download dialog" do
	# 		expect { response }.to be_success
	# 	end
	# end
end
