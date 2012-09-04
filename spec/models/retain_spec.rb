require 'spec_helper'

describe Retain do

  it "has a valid factory" do
    FactoryGirl.create(:retain).should be_valid
  end

  it "fails without code" do
    retain = FactoryGirl.build(:retain, code: nil).should_not be_valid
  end

  it "fails without description" do
    retain = FactoryGirl.build(:retain, description: nil).should_not be_valid
  end

end
