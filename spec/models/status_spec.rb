require 'spec_helper'

describe Status do

  it "has a valid factory" do
    FactoryGirl.create(:status).should be_valid
  end

  it "fails without code" do
    status = FactoryGirl.build(:status, code: nil).should_not be_valid
  end

  it "fails without description" do
    status = FactoryGirl.build(:status, description: nil).should_not be_valid
  end

end
