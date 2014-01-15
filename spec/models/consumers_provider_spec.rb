require 'spec_helper'

describe ConsumersProvider do

  it "has a valid factory" do
    expect(FactoryGirl.build(:consumers_provider)).to be_valid
  end

  it "fails without consumer" do
    expect(FactoryGirl.build(:consumers_provider, consumer: nil)).not_to be_valid
  end

  it "fails without provider" do
    expect(FactoryGirl.build(:consumers_provider, provider: nil)).
      not_to be_valid
  end

  it "fails without fulltext" do
    expect(FactoryGirl.build(:consumers_provider, fulltext: nil)).
      not_to be_valid
  end

end
