require 'spec_helper'

describe ConsumersProvider do

  it "has a valid factory" do
    FactoryGirl.create(:consumers_provider).should be_valid
  end

  it "fails without consumer" do
    cp = FactoryGirl.build(:consumers_provider, consumer: nil).should_not be_valid
  end

  it "fails without provider" do
    cp = FactoryGirl.build(:consumers_provider, provider: nil).should_not be_valid
  end

  it "fails without fulltext" do
    cp = FactoryGirl.build(:consumers_provider, fulltext: nil).should_not be_valid
  end
end
