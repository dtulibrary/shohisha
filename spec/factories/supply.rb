FactoryGirl.define do
  factory :supply do |f| 
    f.sequence(:code) { |n| "supply#{n}" }
  end
end
