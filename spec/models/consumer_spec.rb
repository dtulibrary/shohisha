require 'spec_helper'

describe Consumer do

  it "has a valid factory" do
    expect(FactoryGirl.build(:consumer)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:consumer, code: nil)).not_to be_valid
  end

  it "fails without description" do
    expect(FactoryGirl.build(:consumer, description: nil)).not_to be_valid
  end

  it "name is the description" do
    consumer = FactoryGirl.build(:consumer)
    expect(consumer.name).to eq consumer.description
  end

  it "code is unique" do
    consumer = FactoryGirl.create(:consumer)
    expect(FactoryGirl.build(:consumer, code: consumer.code)).not_to be_valid
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
    expect{consumer.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
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
    expect{consumer.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end

