require 'spec_helper'

describe ConsumersPackage do

  it "has a valid factory" do
    FactoryGirl.build(:consumers_package).should be_valid
  end

  it "fails without consumer" do
    FactoryGirl.build(:consumers_package, consumer: nil).should_not be_valid
  end

  it "fails without package" do
    FactoryGirl.build(:consumers_package, package: nil).should_not be_valid
  end

  it "fails without fulltext" do
    FactoryGirl.build(:consumers_package, fulltext: nil).should_not be_valid
  end

end
