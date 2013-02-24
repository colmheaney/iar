require 'spec_helper'

describe "AuthenticationPages" do
	describe "Authentication" do
		
		subject { page }

		describe "signin page" do
			before { visit signin_path }

			it { should have_selector('h1', text: 'Sign in') }
			it { should have_selector('title', text: 'Sign in') }
		end

		describe "signin" do
			before { visit signin_path }

			describe "with invalid information" do
				before { click_button('Sign in') }

				it { should have_selector('title', text: 'Sign in') }
				it { should have_selector('div.alert.alert-error', text: 'Invalid') }

				describe "after visiting another page" do
					before { click_link 'Home' }
					it { should_not have_selector('div.alert.alert-error') }
				end
			end

			describe "with valid information" do
				let(:user) { FactoryGirl.create(:user) }
				before do
					fill_in "Email", with: user.email.upcase
					fill_in "Password", with: user.password
					click_button 'Sign in'
				end	

				it { should have_selector('title', text: full_title('')) }
				it { should have_link('Sign out', href: signout_path) } 

				describe "followed by signout" do
					before { click_link 'Sign out' }
					it { should_not have_link 'Sign out' }
				end
			end
		end
	end

	describe "authorisation" do
		
		describe "for non-signed in users" do
			
			let(:user) { FactoryGirl.create(:user) }
			let(:event) { FactoryGirl.create(:event) }

			describe "in the users controller" do
				
				# describe "visiting the edit page" do
			 #        before { visit edit_event_path(event) }
			 #        it { should have_selector('title', text: full_title('Sign in')) }
				# end

				describe "submitting to the update action" do
					before { put event_path(event) }
					specify { response.should redirect_to(signin_path)}
				end
			end

			describe "when attempting to visit a protected page" do
				before do
					visit edit_event_path(event)
					fill_in	"Email", with: user.email
					fill_in "Password", with: user.password
					click_button "Sign in"
				end

				describe "after signing in" do
					it "should render the correct protected page" do
						page.should have_selector('title', text: 'Update event')
					end
				end
			end
		end
	end
end
