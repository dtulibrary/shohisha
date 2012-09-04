FactoryGirl.define do
  factory :consumers_provider do |f|
    f.association :consumer
    f.association :provider
    f.association :fulltext
  end
end
