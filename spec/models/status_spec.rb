require 'spec_helper'

describe Status do

  it "has a valid factory" do
    FactoryGirl.create(:status).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:status, code: nil).should_not be_valid
  end

  it "returns untranslated name" do
    status = FactoryGirl.build(:status)
    status.name.should eq "translation missing: en.shohisha.code.status."+status.code
  end

  it "code is unique" do
    status = FactoryGirl.create(:status)
    FactoryGirl.build(:status, code: status.code).should_not be_valid
  end

end
