FactoryBot.define do
  factory :item_payment do
    token          { 'tk000000000000000000' }
    postal_code    { '123-1234' }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building       { Faker::Address.building_number }
    phone_number   { Faker::Number.number(digits: 11) }
  end
end
