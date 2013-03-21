FactoryGirl.define do
  factory :status do |f| 
    f.sequence(:code) { |n| "status#{n}" }
  end
end
