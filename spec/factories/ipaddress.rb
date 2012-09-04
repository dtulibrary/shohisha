FactoryGirl.define do
  factory :ipaddress do |f| 
    f.association :provider
    f.sequence(:address) { |n| "127.0.0.#{n}" }
  end
end
