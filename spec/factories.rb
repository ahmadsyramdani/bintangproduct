FactoryBot.define do
  factory :product, class: Product do
    name { Faker::Book.title }
    price { 20000 }
    image { Faker::LoremPixel.image("730x411") }
    category { Faker::Book.genre }
    email { Faker::Internet.email }
  end
end
