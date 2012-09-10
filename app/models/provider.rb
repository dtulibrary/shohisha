class Provider < ActiveRecord::Base
  attr_accessible :description, :code, :supply_ids, :consumers_providers_attributes, :packages_attributes,
    :ipaddresses_attributes, :type_id

  has_and_belongs_to_many :supplies
  has_many :packages
  has_many :consumers_providers
  has_many :consumers, :through => :consumers_providers
  has_many :ipaddresses
  has_many :fetchers
  accepts_nested_attributes_for :consumers_providers, :allow_destroy => true
  accepts_nested_attributes_for :packages, :allow_destroy => true
  accepts_nested_attributes_for :ipaddresses, :allow_destroy => true
  belongs_to :provider_type

  validates :code,  :presence => true
  validates :description, :presence => true
  validates :type_id, :presence => true
end
