FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Basic #{n}" }
    freigth_rule { Faker::Lorem.paragraph }
    logo { Rack::Test::UploadedFile.new(
      Rails.root.join("spec/support/images/product_image.png")
    )}
  end
end
