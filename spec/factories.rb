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
	end
end