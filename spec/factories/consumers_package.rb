FactoryGirl.define do
  factory :consumers_package do |f|
    f.association :consumer
    f.association :package
    f.association :fulltext
  end
end
