FactoryBot.define do
  factory :offer do
    sequence(:name) { |n| "Basic #{n}" }
    cupom { %i(SAVEWHEY SAVEWHEY11 SUPLE30 SAVE-BLACK).sample }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 100.0..400.0)}
    store
  end
end

