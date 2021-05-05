FactoryBot.define do
  password = '1a'+ Faker::Internet.password(min_length: 6, max_length: 100)

  factory :user do
    nickname              { "yamada" }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
    first_name            { "ぜんかく" }
    family_name           { "ぜんかく" }
    first_name_kana       { "ゼンカクカナ" }
    family_name_kana      { "ゼンカクカナ" }
    birthday              { "2020-01-01" }
  end
end