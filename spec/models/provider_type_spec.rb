require 'spec_helper'

describe ProviderType do

  it "has a valid factory" do
    FactoryGirl.create(:provider_type).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:provider_type, code: nil).should_not be_valid
  end

  it "returns untranslated name" do
    type = FactoryGirl.build(:provider_type)
    type.name.should eq "translation missing: en.shohisha.code.provider_type."+type.code
  end

  it "code is unique" do
    provider_type = FactoryGirl.create(:provider_type)
    FactoryGirl.build(:provider_type, code: provider_type.code).should_not be_valid
  end

  it "restrict delete with provider" do
    provider = FactoryGirl.create(:provider)
    assert_raise ActiveRecord::DeleteRestrictionError do
      provider.provider_type.destroy
    end
  end
end
