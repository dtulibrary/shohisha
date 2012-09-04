require 'spec_helper'

describe ProviderType do

  it "has a valid factory" do
    FactoryGirl.create(:provider_type).should be_valid
  end

  it "fails without code" do
    @provider = FactoryGirl.build(:provider_type, code: nil).should_not be_valid
  end

  it "fails without description" do
    @provider = FactoryGirl.build(:provider_type, description: nil).should_not be_valid
  end

end
