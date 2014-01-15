require 'spec_helper'

describe Fulltext do

  it "has a valid factory" do
    expect(FactoryGirl.build(:fulltext)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:fulltext, code: nil)).not_to be_valid
  end

  it "returns untranslated name" do
    fulltext = FactoryGirl.build(:fulltext)
    expect(fulltext.name).to eq "translation missing: "+
      "en.shohisha.code.fulltext."+fulltext.code
  end

  it "code is unique" do
    fulltext = FactoryGirl.create(:fulltext)
    expect(FactoryGirl.build(:fulltext, code: fulltext.code)).not_to be_valid
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
    expect{fulltext.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
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
    expect{fulltext.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
