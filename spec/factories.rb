FactoryGirl.define do 
  factory :user do
    name Faker::Name.name
    encrypted_password User.new(:password => "password8").encrypted_password
    provider "vkontakte"
    uid ('0'..'1').to_a.shuffle[0..7].join
    email Faker::Internet.email
    password "password8"
  end

  factory :post do
    content Faker::Lorem.sentence(5)
    user
  end

  factory :comment do
    content Faker::Lorem.sentence(5)
  end
end