FactoryGirl.define do 
  factory :user do
    name "Example User"
    encrypted_password User.new(:password => "password8").encrypted_password
    provider "vkontakte"
    uid "34559586"
    email Faker::Internet.email
    password "password8"
  end
end