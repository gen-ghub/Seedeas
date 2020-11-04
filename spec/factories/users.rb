FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { 'a1s2d3' }
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
