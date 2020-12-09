FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Basic #{n}" }
    freigth_rule { Faker::Lorem.paragraph }
    logo { "amz-logo.png" }
  end
end
