namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Event.create!(title: "Example Event",
                 description: "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit ametLorem ipsum dolor sit amet",
                 location: "An example location",
                 date: 2011)
    10.times do |n|
      title  = Faker::Name.title
      description = "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit ametLorem ipsum dolor sit amet"
      location  = "An example location"
      date = 2011
      Event.create!(title: title,
                   description: description,
                   location: location,
                   date: date)
    end
  end
end

