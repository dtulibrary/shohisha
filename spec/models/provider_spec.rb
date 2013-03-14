require 'spec_helper'

describe Provider do

  it "has a valid factory" do
    FactoryGirl.create(:provider).should be_valid
  end

  it "fails without code" do
    FactoryGirl.build(:provider, code: nil).should_not be_valid
  end

  it "fails without description" do
    FactoryGirl.build(:provider, description: nil).should_not be_valid
  end

  it "fails without type" do
    FactoryGirl.build(:provider, provider_type: nil).should_not be_valid
  end

  it "name is the description" do
    provider = FactoryGirl.build(:provider)
    provider.name.should eq provider.description
  end

  it "code is unique" do
    provider = FactoryGirl.create(:provider)
    FactoryGirl.build(:provider, code: provider.code).should_not be_valid
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
    assert_raise ActiveRecord::DeleteRestrictionError do
      provider.destroy
    end
  end
  
  it "restrict delete with ip address" do
    ipaddress = FactoryGirl.create(:ipaddress)
    assert_raise ActiveRecord::DeleteRestrictionError do
      ipaddress.provider.destroy
    end
  end

  it "restrict delete with package" do
    package = FactoryGirl.create(:package)
    assert_raise ActiveRecord::DeleteRestrictionError do
      package.provider.destroy
    end
  end

  it "restrict delete with fetcher" do
    fetcher = FactoryGirl.create(:fetcher)
    assert_raise ActiveRecord::DeleteRestrictionError do
      fetcher.provider.destroy
    end
  end

end
