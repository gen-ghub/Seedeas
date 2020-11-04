FactoryBot.define do
  factory :seed do
    title        { Faker::Name.initials(number: 6) }
    tag_id       { 2 }
    idea         { Faker::Name.initials(number: 20) }
    association :user

    after(:build) do |seed|
      seed.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
