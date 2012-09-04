require 'spec_helper'

describe DeliverPeriod do

  it "has a valid factory" do
    FactoryGirl.create(:deliver_period).should be_valid
  end

  it "fails without code" do
    consumer = FactoryGirl.build(:deliver_period, code: nil).should_not be_valid
  end

  it "fails without description" do
    consumer = FactoryGirl.build(:deliver_period, description: nil).should_not be_valid
  end

end
