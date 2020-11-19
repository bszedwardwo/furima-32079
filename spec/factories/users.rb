FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    last_name             {Faker::gimei.last.kanji}
    first_name            {Faker::gimei.first.kanji}
    last_name_kana        {Faker::gimei.last.katakana}
    first_name_kana       {Faker::gimei.first.katakana}
    birth_date            
  end
end