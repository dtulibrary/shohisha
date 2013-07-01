require 'spec_helper'

describe DeliverPeriod do

  it "has a valid factory" do
    FactoryGirl.build(:deliver_period).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:deliver_period, code: nil).should_not be_valid
  end

  it "returns untranslated name" do
    period = FactoryGirl.build(:deliver_period)
    period.name.should eq "translation missing: en.shohisha.code.deliver_period."+period.code
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    assert_raise ActiveRecord::DeleteRestrictionError do
      fetcher.deliver_period.destroy
    end
  end

end
