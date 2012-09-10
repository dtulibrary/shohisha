require 'spec_helper'

describe Fulltext do

  it "has a valid factory" do
    FactoryGirl.create(:fulltext).should be_valid
  end

  it "fails without code" do
    fulltext = FactoryGirl.build(:fulltext, code: nil).should_not be_valid
  end

  it "fails without description" do
    fulltext = FactoryGirl.build(:fulltext, description: nil).should_not be_valid
  end

end