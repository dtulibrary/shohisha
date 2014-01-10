require 'spec_helper'

describe Ipaddress do

  it "has a valid factory" do
    expect(FactoryGirl.build(:ipaddress)).to be_valid
  end

  it "fails without provider" do
    expect(FactoryGirl.build(:ipaddress, provider: nil)).not_to be_valid
  end

  it "fails without address" do
    expect(FactoryGirl.build(:ipaddress, address: nil)).not_to be_valid
  end

  it "destroy with provider" do
    ipaddress = FactoryGirl.create(:ipaddress)
    ipaddress.provider.destroy
    expect(Ipaddress.find_by_id(ipaddress.id)).to eq(nil)
  end

end
