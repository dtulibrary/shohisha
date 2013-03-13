require 'spec_helper'

describe Fulltext do

  it "has a valid factory" do
    FactoryGirl.create(:fulltext).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:fulltext, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:fulltext, description: nil).should_not be_valid
  end

  it "returns untranslated name" do
    fulltext = FactoryGirl.build(:fulltext)
    fulltext.name.should eq "translation missing: en.shohisha.code.fulltext."+fulltext.code
  end

end
