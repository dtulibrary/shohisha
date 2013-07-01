require 'spec_helper'

describe Ipaddress do

  it "has a valid factory" do
    FactoryGirl.build(:ipaddress).should be_valid
  end

  it "fails without provider" do
    FactoryGirl.build(:ipaddress, provider: nil).should_not be_valid
  end

  it "fails without address" do
    FactoryGirl.build(:ipaddress, address: nil).should_not be_valid
  end

  it "destroy with provider" do
    ipaddress = FactoryGirl.create(:ipaddress)
    ipaddress.provider.destroy
    expect(Ipaddress.find_by_id(ipaddress.id)).to eq(nil)
  end

end
