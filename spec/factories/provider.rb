FactoryGirl.define do
  factory :provider do |f|
    f.sequence(:code) { |n| "provider#{n}" }
    f.sequence(:description) { |n| "Provider description #{n}" }
    f.association :provider_type
  end
end
