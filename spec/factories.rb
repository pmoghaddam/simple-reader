FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :feed do
    title { Faker::Lorem.words(5).join(" ").titleize }
    url ( Faker::Internet.url )
  end

  factory :feed_item do
    author { Faker::Name.name }
    read { [true, false].sample }
    title { Faker::Lorem.words(10).join(" ").titleize }
    summary { Faker::Lorem.paragraphs(1).join(" ") }
    url { Faker::Internet.url }
  end

end