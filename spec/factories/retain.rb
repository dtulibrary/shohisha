FactoryGirl.define do
  factory :retain do |f| 
    f.sequence(:code) { |n| "retain#{n}" }
  end
end
