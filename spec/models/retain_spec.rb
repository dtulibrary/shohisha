require 'spec_helper'

describe Retain do

  it "has a valid factory" do
    FactoryGirl.create(:retain).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:retain, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:retain, description: nil).should_not be_valid
  end

  it "returns untranslated name" do
    retain = FactoryGirl.build(:retain)
    retain.name.should eq "translation missing: en.shohisha.code.retain."+retain.code
  end

  it "code is unique" do
    retain = FactoryGirl.create(:retain)
    FactoryGirl.build(:retain, code: retain.code).should_not be_valid
  end

end
