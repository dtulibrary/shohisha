require 'spec_helper'

describe Provider do

  it "has a valid factory" do
    FactoryGirl.create(:provider).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:provider, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:provider, description: nil).should_not be_valid
  end

  it "fails without type" do
    FactoryGirl.build(:provider, provider_type: nil).should_not be_valid
  end

  it "name is the description" do
    provider = FactoryGirl.build(:provider)
    provider.name.should eq provider.description
  end

end
