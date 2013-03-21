FactoryGirl.define do
  factory :fulltext do |f| 
    f.sequence(:code) { |n| "fulltext#{n}" }
  end
end
