require 'spec_helper'

describe Supply do

  it "has a valid factory" do
    FactoryGirl.create(:supply).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:supply, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:supply, description: nil).should_not be_valid
  end

  it "fails with description short than 5 characters" do
    FactoryGirl.build(:supply, description: "desc").should_not be_valid
  end

  it "returns untranslated name" do
    supply = FactoryGirl.build(:supply)
    supply.name.should eq "translation missing: en.shohisha.code.supply."+supply.code
  end

end
