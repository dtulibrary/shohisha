FactoryGirl.define do
  factory :status do |f| 
    f.sequence(:code) { |n| "status#{n}" }
    f.sequence(:description) { |n| "Status description #{n}" }
  end
end
