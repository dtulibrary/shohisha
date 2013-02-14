require 'spec_helper'

describe Fetcher do

  it "has a valid factory" do
    FactoryGirl.create(:fetcher).should be_valid
  end

  it "fails without provider" do
    fetcher = FactoryGirl.build(:fetcher, provider: nil).should_not be_valid
  end

  it "fails without status" do
    fetcher = FactoryGirl.build(:fetcher, status: nil).should_not be_valid
  end

  it "fails without transport" do
    fetcher = FactoryGirl.build(:fetcher, transport: nil).should_not be_valid
  end

  it "fails without retain" do
    fetcher = FactoryGirl.build(:fetcher, retain: nil).should_not be_valid
  end

  # TODO: How to do this validation
  #it "fails if user without password" do
  #  fetcher = FactoryGirl.build(:fetcher, user: nil).should_not be_valid
  #end
    
  # TODO: How to do this validation
  #it "fails if password without user" do
  #  fetcher = FactoryGirl.build(:fetcher, password: nil).should_not be_valid
  #end

  describe "charset" do
    it "fails if charset is not a known value" do
      fetcher = FactoryGirl.build(:fetcher, charset: "foo").should_not be_valid
    end

    it "works if charset is a known value" do
      fetcher = FactoryGirl.build(:fetcher, charset: "utf-8").should be_valid
    end
  end

  describe "set_limit" do
    it "fails if set limit isn't known value" do
      fetcher = FactoryGirl.build(:fetcher, set_limit: "bar").should_not be_valid
    end

    it "works if set limit is known value" do
      fetcher = FactoryGirl.build(:fetcher, set_limit: "month").should be_valid
    end
  end

  # TODO: Recursive should be a numeric value
  describe "recursive" do
    it "fails if recursive isn't numeric" do
      fetcher = FactoryGirl.build(:fetcher, recursive: "bar").should_not be_valid
    end

    it "works if recursive is numeric" do
      fetcher = FactoryGirl.build(:fetcher, recursive: "10").should be_valid
    end
  end

  describe "timeout" do
    it "fails if timeout isn't numeric" do
      fetcher = FactoryGirl.build(:fetcher, timeout: "bar").should_not be_valid
    end

    it "works if timeout is numeric" do
      fetcher = FactoryGirl.build(:fetcher, timeout: "10").should be_valid
    end
  end

  # TODO: Seperator should be / or \ (unix, dos respectively)
  describe "seperator" do
    it "fails if seperator isn't / or \\" do
      fetcher = FactoryGirl.build(:fetcher, seperator: "b").should_not be_valid
    end

    it "works if seperator is /" do
      fetcher = FactoryGirl.build(:fetcher, seperator: "/").should be_valid
    end

    it "works if seperator is \\" do
      fetcher = FactoryGirl.build(:fetcher, seperator: "\\").should be_valid
    end
  end

end
