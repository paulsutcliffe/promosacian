require 'faker'

FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.email }
    password "chimpance99"
    password_confirmation "chimpance99"
  end
end
