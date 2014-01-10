require 'spec_helper'

describe Supply do

  it "has a valid factory" do
    expect(FactoryGirl.build(:supply)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:supply, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    supply = FactoryGirl.build(:supply)
    expect(supply.name).to eq "translation missing: "+
      "en.shohisha.code.supply."+supply.code
  end

  it "code is unique" do
    supply = FactoryGirl.create(:supply)
    expect(FactoryGirl.build(:supply, code: supply.code)).not_to be_valid
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.supply.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
