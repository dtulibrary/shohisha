require 'spec_helper'

describe Transport do

  it "has a valid factory" do
    FactoryGirl.build(:transport).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:transport, code: nil).should_not be_valid
  end

  it "returns untranslated name" do
    transport = FactoryGirl.build(:transport)
    transport.name.should eq "translation missing: en.shohisha.code.transport."+transport.code
  end

  it "code is unique" do
    transport = FactoryGirl.create(:transport)
    FactoryGirl.build(:transport, code: transport.code).should_not be_valid
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    assert_raise ActiveRecord::DeleteRestrictionError do
      fetcher.transport.destroy
    end
  end

end
