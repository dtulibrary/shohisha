require 'spec_helper'

describe Retain do

  it "has a valid factory" do
    expect(FactoryGirl.build(:retain)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:retain, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    retain = FactoryGirl.build(:retain)
    expect(retain.name).to eq "translation missing: "+
      "en.shohisha.code.retain."+retain.code
  end

  it "code is unique" do
    retain = FactoryGirl.create(:retain)
    expect(FactoryGirl.build(:retain, code: retain.code)).not_to be_valid
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.retain.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
