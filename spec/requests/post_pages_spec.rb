require 'spec_helper'

describe "PostPages" do

	subject { page }

	describe "post page" do
		let(:post) { FactoryGirl.create(:post) }
		before { visit post_path(post) }

		it { should have_selector('h1', text: post.title) }
		it { should have_selector('title', text: post.title) }
	end

	describe "new post page" do
		
		let(:user) { FactoryGirl.create(:user) }
		let(:submit) { "Create Post" }

		before do
			sign_in user
			visit new_post_path 
		end

		it { should have_selector('h1', text: 'Add new post') }
		it { should have_selector('title', text: full_title('Add new post')) }

		describe "with invalid information" do
			it "should not create a post" do
				expect { click_button submit }.not_to change(Post, :count)	
			end
		end

		describe "with valid information" do
			before do
				fill_in "Title", with: "Example title"
				fill_in	"Body", with: "Example post"
			end

			it "should create a post" do
				expect{ click_button submit }.to change(Post, :count).by(1)
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		let(:post) { FactoryGirl.create(:post) }
		
		before do
			sign_in user			
			visit edit_post_path(post)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update Post") }
			it { should have_selector('title', text: full_title('Update Post')) }
		end

		describe "with invalid information" do
			before do 
				fill_in "Title", with: " "
				click_button "Update Post" 
			end

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_title) { "New title" }
			let(:new_body) { "New post" }
			before do
				fill_in "Title", with: new_title
				fill_in "Body", with: new_body
				click_button "Update Post"
			end

			it { should have_selector('title', text: new_title) }
			it { should have_selector('div.alert.alert-success') }
			specify { post.reload.title.should == new_title }
			specify { post.reload.body.should == new_body }
		end
	end

	describe "index" do
		
		let(:post) { FactoryGirl.create(:post) }

		before(:each) do
			visit posts_path
		end

		it { should have_selector('title', text: 'Posts') }
		it { should have_selector('h1', text: 'Posts') }

		# describe "pagination" do
			
		# 	before(:all) { 20.times {FactoryGirl.create(:post) } }
		# 	after(:all) { Post.delete_all }

		# 	it { should have_selector('div.pagination') }

		# 	it "should list each post" do
		# 		Post.paginate(page: 1).each do |post|
		# 			page.should have_selector('li', text: post.title)
		# 		end
		# 	end
		# end
	end

	describe "deleting a post" do
		before { FactoryGirl.create(:post) }
		let(:user) { FactoryGirl.create(:user) }

		describe "as signed in user" do
			before do 
				sign_in user
				visit posts_path
			end
			
			it "should delete an post" do
				expect { click_link 'delete' }.to change(Post, :count).by(-1)
			end
		end		
	end
end
