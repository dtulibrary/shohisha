require 'spec_helper'

describe Provider do

  it "has a valid factory" do
    expect(FactoryGirl.build(:provider)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:provider, code: nil)).not_to be_valid
  end

  it "fails without description" do
    expect(FactoryGirl.build(:provider, description: nil)).not_to be_valid
  end

  it "fails without type" do
    expect(FactoryGirl.build(:provider, provider_type: nil)).not_to be_valid
  end

  it "name is the description" do
    provider = FactoryGirl.build(:provider)
    expect(provider.name).to eq provider.description
  end

  it "code is unique" do
    provider = FactoryGirl.create(:provider)
    expect(FactoryGirl.build(:provider, code: provider.code)).not_to be_valid
  end

  it "restrict delete with consumer" do
    consumer = FactoryGirl.create(:consumer)
    provider = FactoryGirl.create(:provider)
    fulltext = FactoryGirl.create(:fulltext)
    consumer_provider = ConsumersProvider.new(
      { provider_id: provider.id, consumer_id: consumer.id,
        fulltext_id: fulltext.id
      }
    )
    consumer.consumers_providers = [consumer_provider]
    expect{provider.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end
  
  it "restrict delete with package" do
    package = FactoryGirl.create(:package)
    expect{package.provider.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    expect{fetcher.provider.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
