require 'spec_helper'

describe Supply do

  it "has a valid factory" do
    FactoryGirl.create(:supply).should be_valid
  end

  it "fails without code" do
    supply = FactoryGirl.build(:supply, code: nil).should_not be_valid
  end

  it "fails without description" do
    supply = FactoryGirl.build(:supply, description: nil).should_not be_valid
  end

  it "fails with description short than 5 characters" do
    supply = FactoryGirl.build(:supply, description: "desc").should_not be_valid
  end


end
