FactoryGirl.define do
  factory :fulltext do |f| 
    f.sequence(:code) { |n| "fulltext#{n}" }
    f.sequence(:description) { |n| "Fulltext description #{n}" }
  end
end
