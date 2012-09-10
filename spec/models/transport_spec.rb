require 'spec_helper'

describe Transport do

  it "has a valid factory" do
    FactoryGirl.create(:transport).should be_valid
  end

  it "fails without code" do
    transport = FactoryGirl.build(:transport, code: nil).should_not be_valid
  end

  it "fails without description" do
    transport = FactoryGirl.build(:transport, description: nil).should_not be_valid
  end

end