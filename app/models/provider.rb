class Provider < ActiveRecord::Base
  attr_accessible :description, :code, :supply_ids, :consumers_providers_attributes, :packages_attributes

  has_and_belongs_to_many :supplies
  has_many :packages
  has_many :consumers_providers
  has_many :consumers, :through => :consumers_providers
  accepts_nested_attributes_for :consumers_providers, :allow_destroy => true
  accepts_nested_attributes_for :packages, :allow_destroy => true

  validates :code,  :presence => true
  validates :description, :presence => true
end
