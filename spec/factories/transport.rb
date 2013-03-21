FactoryGirl.define do
  factory :transport do |f| 
    f.sequence(:code) { |n| "transport#{n}" }
  end
end
