require 'spec_helper'

describe Consumer do

  it "has a valid factory" do
    FactoryGirl.create(:consumer).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:consumer, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:consumer, description: nil).should_not be_valid
  end

  it "name is the description" do
    consumer = FactoryGirl.build(:consumer)
    consumer.name.should eq consumer.description
  end

  it "code is unique" do
    consumer = FactoryGirl.create(:consumer)
    FactoryGirl.build(:consumer, code: consumer.code).should_not be_valid
  end

  it "restrict delete with provider" do
    consumer = FactoryGirl.create(:consumer)
    provider = FactoryGirl.create(:provider)
    fulltext = FactoryGirl.create(:fulltext)
    consumer_provider = ConsumersProvider.new(
      { provider_id: provider.id, consumer_id: consumer.id,
        fulltext_id: fulltext.id
      }
    )
    provider.consumers_providers = [consumer_provider]
    assert_raise ActiveRecord::DeleteRestrictionError do
      consumer.destroy
    end
  end

  it "restrict delete with package" do
    consumer = FactoryGirl.create(:consumer)
    package = FactoryGirl.create(:package)
    fulltext = FactoryGirl.create(:fulltext)
    consumer_package = ConsumersPackage.new(
      { package_id: package.id, consumer_id: consumer.id,
        fulltext_id: fulltext.id
      }
    )
    package.consumers_packages = [consumer_package]
    assert_raise ActiveRecord::DeleteRestrictionError do
      consumer.destroy
    end
  end

end

