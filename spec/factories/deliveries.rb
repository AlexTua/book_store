FactoryGirl.define do
  factory :delivery do
    name FFaker::Book.title
    min_day 1
    max_day 2
    price 10
  end
end