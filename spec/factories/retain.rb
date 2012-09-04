FactoryGirl.define do
  factory :retain do |f| 
    f.sequence(:code) { |n| "retain#{n}" }
    f.sequence(:description) { |n| "Retain description #{n}" }
  end
end
