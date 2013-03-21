FactoryGirl.define do
  factory :deliver_period do |f|
    f.sequence(:code) { |n| "period#{n}" }
  end
end
