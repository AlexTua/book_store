FactoryGirl.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address_name 'Street'
    city 'City'
    zip '12345'
    country 'Ukraine'
    phone '+3454545'
  end
end
