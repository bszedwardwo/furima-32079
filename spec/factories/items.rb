FactoryBot.define do
  factory :item do
    name                    { Faker::Commerce.product_name }
    info                    { Faker::Name.name }
    price                   { Faker::Number.within(range: 300..9_999_999) }
    category_id             { Faker::Number.within(range: 1..10) }
    sales_status_id         { Faker::Number.within(range: 1..10) }
    shipping_fee_status_id  { Faker::Number.within(range: 1..6) }
    prefecture_id           { Faker::Number.within(range: 1..47) }
    scheduled_delivery_id   { Faker::Number.within(range: 1..3) }
    association             :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
