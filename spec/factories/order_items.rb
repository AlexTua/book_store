FactoryGirl.define do
  factory :order_item do
    association :book
    association :order
    quantity 5
  end
end
