require 'spec_helper'

describe Ipaddress do

  it "has a valid factory" do
    FactoryGirl.create(:ipaddress).should be_valid
  end

  it "fails without provider" do
    FactoryGirl.build(:ipaddress, provider: nil).should_not be_valid
  end

  it "fails without address" do
    FactoryGirl.build(:ipaddress, address: nil).should_not be_valid
  end

end
