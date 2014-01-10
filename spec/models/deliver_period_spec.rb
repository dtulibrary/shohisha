require 'spec_helper'

describe DeliverPeriod do

  it "has a valid factory" do
    expect(FactoryGirl.build(:deliver_period)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:deliver_period, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    period = FactoryGirl.build(:deliver_period)
    expect(period.name).to eq "translation missing: "+
      "en.shohisha.code.deliver_period."+period.code
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.deliver_period.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
