FactoryGirl.define do
  factory :supply do |f| 
    f.sequence(:code) { |n| "supply#{n}" }
    f.sequence(:description) { |n| "Supply description #{n}" }
  end
end
