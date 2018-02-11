FactoryGirl.define do
  factory :book do
    title FFaker::Book.title
    price FFaker::Vehicle.engine_cylinders
    quantity 10
    year FFaker::Vehicle.year
    dimensions H: 2.4, W: 1.3, D: 0.6
    materials 'paper, brick, hardcove'
    description FFaker::LoremRU.paragraph
  end

  trait :long_description do
    description FFaker::LoremRU.paragraph
  end
end
