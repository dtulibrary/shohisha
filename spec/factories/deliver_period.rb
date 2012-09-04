FactoryGirl.define do
  factory :deliver_period do |f|
    f.sequence(:code) { |n| "period#{n}" }
    f.sequence(:description) { |n| "Deliver Period #{n}" }
  end
end
