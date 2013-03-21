FactoryGirl.define do
  factory :provider_type do |f|
    f.sequence(:code) { |n| "providertype#{n}" }
  end
end
