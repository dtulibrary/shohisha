require 'spec_helper'

describe Consumer do

  it "has a valid factory" do
    FactoryGirl.create(:consumer).should be_valid
  end

  it "fails without code" do
    consumer = FactoryGirl.build(:consumer, code: nil).should_not be_valid
  end

  it "fails without description" do
    consumer = FactoryGirl.build(:consumer, description: nil).should_not be_valid
  end

end
