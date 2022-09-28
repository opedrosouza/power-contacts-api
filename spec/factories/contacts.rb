# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday.strftime('%F') }
    phone { '(+55) 000 000 00 00' }
    address { Faker::Address.full_address }
    email { Faker::Internet.safe_email }
    association :user
  end
end
