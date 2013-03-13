FactoryGirl.define do
  factory :fetcher do |f| 
    f.association :provider
    f.association :status
    f.association :transport
    f.association :retain
    f.association :deliver_period
    f.association :supply

    f.sequence(:basename) { |n| "http://example#{n}.com/fetch" }
    f.charset "utf-8"
    f.directory "."
    f.directory_filter "."
    f.file_filter "."
    f.username "user"
    f.password "password"
    f.remote_delete "0"
  end
end
