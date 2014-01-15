require 'spec_helper'

describe Fetcher do

  it "has a valid factory" do
    expect(FactoryGirl.build(:fetcher)).to be_valid
  end

  it "fails without provider" do
    expect(FactoryGirl.build(:fetcher, provider: nil)).not_to be_valid
  end

  it "fails without status" do
    expect(FactoryGirl.build(:fetcher, status: nil)).not_to be_valid
  end

  it "fails without transport" do
    expect(FactoryGirl.build(:fetcher, transport: nil)).not_to be_valid
  end

  it "fails without retain" do
    expect(FactoryGirl.build(:fetcher, retain: nil)).not_to be_valid
  end

  it "fails without deliver_period" do
    expect(FactoryGirl.build(:fetcher, deliver_period: nil)).not_to be_valid
  end

  it "fails without supply" do
    expect(FactoryGirl.build(:fetcher, supply: nil)).not_to be_valid
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
      expect(FactoryGirl.build(:fetcher, charset: "foo")).not_to be_valid
    end

    it "works if charset is a known value" do
      expect(FactoryGirl.build(:fetcher, charset: "utf-8")).to be_valid
    end
  end

  describe "set_limit" do
    it "fails if set limit isn't known value" do
      expect(FactoryGirl.build(:fetcher, set_limit: "bar")).not_to be_valid
    end

    it "works if set limit is known value" do
      expect(FactoryGirl.build(:fetcher, set_limit: "month")).to be_valid
    end
  end

  describe "recursive" do
    it "fails if recursive isn't numeric" do
      expect(FactoryGirl.build(:fetcher, recursive: "bar")).not_to be_valid
    end

    it "works if recursive is numeric" do
      expect(FactoryGirl.build(:fetcher, recursive: "10")).to be_valid
    end
  end

  describe "timeout" do
    it "fails if timeout isn't numeric" do
      expect(FactoryGirl.build(:fetcher, timeout: "bar")).not_to be_valid
    end

    it "works if timeout is numeric" do
      expect(FactoryGirl.build(:fetcher, timeout: "10")).to be_valid
    end
  end

  describe "seperator" do
    it "fails if seperator isn't / or \\" do
      expect(FactoryGirl.build(:fetcher, seperator: "b")).not_to be_valid
    end

    it "works if seperator is /" do
      expect(FactoryGirl.build(:fetcher, seperator: "/")).to be_valid
    end

    it "works if seperator is \\" do
      expect(FactoryGirl.build(:fetcher, seperator: "\\")).to be_valid
    end
  end

end
