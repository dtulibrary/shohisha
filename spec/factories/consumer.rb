FactoryGirl.define do
  factory :consumer do |f|
    f.sequence(:code) { |n| "consumer#{n}" }
    f.sequence(:description) { |n| "Consumer desription #{n}" }
  end
end
