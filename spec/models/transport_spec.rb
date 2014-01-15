require 'spec_helper'

describe Transport do

  it "has a valid factory" do
    expect(FactoryGirl.build(:transport)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:transport, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    transport = FactoryGirl.build(:transport)
    expect(transport.name).to eq "translation missing: "+
      "en.shohisha.code.transport."+transport.code
  end

  it "code is unique" do
    transport = FactoryGirl.create(:transport)
    expect(FactoryGirl.build(:transport, code: transport.code)).not_to be_valid
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.transport.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
