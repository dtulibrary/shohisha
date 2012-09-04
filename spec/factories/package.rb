FactoryGirl.define do
  factory :package do |f|
    f.association :provider
    f.sequence(:code) { |n| "package#{n}" }
    f.description "Package"
  end
end
