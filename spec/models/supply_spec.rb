require 'spec_helper'

describe Supply do

  it "has a valid factory" do
    FactoryGirl.create(:supply).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:supply, code: nil).should_not be_valid
  end

  it "returns untranslated name" do
    supply = FactoryGirl.build(:supply)
    supply.name.should eq "translation missing: en.shohisha.code.supply."+supply.code
  end

  it "code is unique" do
    supply = FactoryGirl.create(:supply)
    FactoryGirl.build(:supply, code: supply.code).should_not be_valid
  end

end
