require 'spec_helper'

describe Status do

  it "has a valid factory" do
    expect(FactoryGirl.build(:status)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:status, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    status = FactoryGirl.build(:status)
    expect(status.name).to eq "translation missing: "+
      "en.shohisha.code.status."+status.code
  end

  it "code is unique" do
    status = FactoryGirl.create(:status)
    expect(FactoryGirl.build(:status, code: status.code)).not_to be_valid
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.status.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
