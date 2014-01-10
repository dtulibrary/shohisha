require 'spec_helper'

describe ProviderType do

  it "has a valid factory" do
    expect(FactoryGirl.build(:provider_type)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:provider_type, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    type = FactoryGirl.build(:provider_type)
    expect(type.name).to eq "translation missing: "+
      "en.shohisha.code.provider_type."+type.code
  end

  it "code is unique" do
    provider_type = FactoryGirl.create(:provider_type)
    expect(FactoryGirl.build(:provider_type, code: provider_type.code)).
      not_to be_valid
  end

  it "restrict delete with provider" do
    provider = FactoryGirl.create(:provider)
    expect{provider.provider_type.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end
end
