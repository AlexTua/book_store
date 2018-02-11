FactoryGirl.define do
  factory :review do
    association :book
    content FFaker::CheesyLingo.sentence
    title 'title'
    rating 4
    status 'approved'
  end
end
