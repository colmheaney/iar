require 'spec_helper'

describe "EventPages" do

	subject { page }

	describe "events page" do
		before { visit events_path }

		it { should have_selector('h1', text: 'News/Events') }
		it { should have_selector('title', text: full_title('News/Events')) }
	end
end
