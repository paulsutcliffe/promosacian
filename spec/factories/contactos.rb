require 'faker'

FactoryGirl.define do
  factory :contacto do
    nombre { Faker::Name.name }
    telefono { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    pais = "PE"

    factory :invalid_contacto do
      email nil
    end
  end
end
