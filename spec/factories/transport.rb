FactoryGirl.define do
  factory :transport do |f| 
    f.sequence(:code) { |n| "transport#{n}" }
    f.sequence(:description) { |n| "Transport description #{n}" }
  end
end
