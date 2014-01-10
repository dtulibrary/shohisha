require 'spec_helper'

describe Package do

  it "has a valid factory" do
    expect(FactoryGirl.build(:package)).to be_valid
  end

  it "fails without code" do
    expect(FactoryGirl.build(:package, code: nil)).not_to be_valid
  end

  it "fails without description" do
    expect(FactoryGirl.build(:package, description: nil)).not_to be_valid
  end

  it "fails without provider" do
    expect(FactoryGirl.build(:package, provider: nil)).not_to be_valid
  end

  describe "Package test nested attributes" do
    it "create/delete consumer package relationship" do
      consumer = FactoryGirl.create(:consumer)
      fulltext = FactoryGirl.create(:fulltext)
      package = FactoryGirl.create(:package)
      package.update_attributes({
        'id' => package.id,
        'code' => package.code,
        'description' => package.description,
        'consumers_packages_attributes' => {
          '0' => {
            'consumer_id' => consumer.id,
            'package_id' => package.id,
            'fulltext_id' => fulltext.id
          }
        }
      })
      package.reload
      expect(package.consumers).to match_array([consumer])

      #relations = package.consumers.where(nil)
      #relations.first.should eq '0'
      #package.consumers.scoped.should eq '0'

      # TODO: Figure out how to find the id of relation it self, not the
      #       cumstomer id it points to.
      #relations = package.consumers.relations
      #relations.first.should eq '0'
      #package.update_attributes({
      #  'id' => package.id,
      #  'code' => package.code,
      #  'description' => package.description,
      #  'consumers_packages_attributes' => {
      #    '0' => {
      #      'id' => relations[0].id,
      #      '_destroy' => '1'
      #    }
      #  }
      #})
      #package.reload
      #package.consumers.should eq ([])
    end
  end

  it "name is the description" do
    package = FactoryGirl.build(:package)
    expect(package.name).to eq package.description
  end

  it "code is unique" do
    package = FactoryGirl.create(:package)
    expect(FactoryGirl.build(:package, code: package.code)).not_to be_valid
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
    consumer.consumers_packages = [consumer_package]
    expect{package.destroy}.to raise_error(
      ActiveRecord::DeleteRestrictionError)
  end

end
