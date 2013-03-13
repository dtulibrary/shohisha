require 'spec_helper'

describe Transport do

  it "has a valid factory" do
    FactoryGirl.create(:transport).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:transport, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:transport, description: nil).should_not be_valid
  end

  it "returns untranslated name" do
    transport = FactoryGirl.build(:transport)
    transport.name.should eq "translation missing: en.shohisha.code.transport."+transport.code
  end

end
