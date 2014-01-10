require 'spec_helper'

describe ConsumersPackage do

  it "has a valid factory" do
    expect(FactoryGirl.build(:consumers_package)).to be_valid
  end

  it "fails without consumer" do
    expect(FactoryGirl.build(:consumers_package, consumer: nil)).not_to be_valid
  end

  it "fails without package" do
    expect(FactoryGirl.build(:consumers_package, package: nil)).not_to be_valid
  end

  it "fails without fulltext" do
    expect(FactoryGirl.build(:consumers_package, fulltext: nil)).not_to be_valid
  end

end
