require 'spec_helper'

describe Fetcher do

  it "has a valid factory" do
    FactoryGirl.create(:fetcher).should be_valid
  end

  it "fails without provider" do
    FactoryGirl.build(:fetcher, provider: nil).should_not be_valid
  end

  it "fails without status" do
    FactoryGirl.build(:fetcher, status: nil).should_not be_valid
  end

  it "fails without transport" do
    FactoryGirl.build(:fetcher, transport: nil).should_not be_valid
  end

  it "fails without retain" do
    FactoryGirl.build(:fetcher, retain: nil).should_not be_valid
  end

  it "fails without deliver_period" do
    fetcher = FactoryGirl.build(:fetcher, deliver_period: nil).should_not be_valid
  end

  it "fails without supply" do
    fetcher = FactoryGirl.build(:fetcher, supply: nil).should_not be_valid
  end

  # TODO: How to do this validation
  #it "fails if user without password" do
  #  FactoryGirl.build(:fetcher, user: nil).should_not be_valid
  #end
    
  # TODO: How to do this validation
  #it "fails if password without user" do
  #  FactoryGirl.build(:fetcher, password: nil).should_not be_valid
  #end

  describe "charset" do
    it "fails if charset is not a known value" do
      FactoryGirl.build(:fetcher, charset: "foo").should_not be_valid
    end

    it "works if charset is a known value" do
      FactoryGirl.build(:fetcher, charset: "utf-8").should be_valid
    end
  end

  describe "set_limit" do
    it "fails if set limit isn't known value" do
      FactoryGirl.build(:fetcher, set_limit: "bar").should_not be_valid
    end

    it "works if set limit is known value" do
      FactoryGirl.build(:fetcher, set_limit: "month").should be_valid
    end
  end

  describe "recursive" do
    it "fails if recursive isn't numeric" do
      FactoryGirl.build(:fetcher, recursive: "bar").should_not be_valid
    end

    it "works if recursive is numeric" do
      FactoryGirl.build(:fetcher, recursive: "10").should be_valid
    end
  end

  describe "timeout" do
    it "fails if timeout isn't numeric" do
      FactoryGirl.build(:fetcher, timeout: "bar").should_not be_valid
    end

    it "works if timeout is numeric" do
      FactoryGirl.build(:fetcher, timeout: "10").should be_valid
    end
  end

  describe "seperator" do
    it "fails if seperator isn't / or \\" do
      FactoryGirl.build(:fetcher, seperator: "b").should_not be_valid
    end

    it "works if seperator is /" do
      FactoryGirl.build(:fetcher, seperator: "/").should be_valid
    end

    it "works if seperator is \\" do
      FactoryGirl.build(:fetcher, seperator: "\\").should be_valid
    end
  end

end
