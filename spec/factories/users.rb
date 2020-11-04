FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { 'a1s2d3' }
    password_confirmation {password}
  end
end
