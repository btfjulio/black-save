FactoryBot.define do
  factory :offer do
    sequence(:title) { |n| "Basic #{n}" }
    coupon { %i(SAVEWHEY SAVEWHEY11 SUPLE30 SAVE-BLACK).sample }
    body { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0)}
    link { Faker::Internet.url }
    store
  end
end

