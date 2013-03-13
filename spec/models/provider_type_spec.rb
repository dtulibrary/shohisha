require 'spec_helper'

describe ProviderType do

  it "has a valid factory" do
    FactoryGirl.create(:provider_type).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:provider_type, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:provider_type, description: nil).should_not be_valid
  end

  it "returns untranslated name" do
    type = FactoryGirl.build(:provider_type)
    type.name.should eq "translation missing: en.shohisha.code.provider_type."+type.code
  end

end
