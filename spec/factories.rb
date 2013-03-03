include ActionDispatch::TestProcess

FactoryGirl.define do
	factory :user do
		name "Colm Heaney"
		email "colm@example.com"
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end

	factory :event do
		title "An event title"
		description "An event description"
		location "a hole somewhere"
		date "2011"
	end

	factory :publication do
		title "A publication title"
		description "A publication description"
		image {  fixture_file_upload(Rails.root + 'spec/fixtures/images/example.jpg', "image/jpg") }
		file {  fixture_file_upload(Rails.root + 'spec/fixtures/files/example.txt', "file/txt") }
	end

	factory :post do
		title "A post title"
		body "A new post"
		published_date "2012-02-02"
		user_id "1"
	end	
end