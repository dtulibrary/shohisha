class Provider < ActiveRecord::Base
  attr_accessible :description, :code, :supply_ids, :consumers_providers_attributes, :packages_attributes,
    :ipaddresses_attributes, :provider_type_id

  has_and_belongs_to_many :supplies
  has_many :packages, :dependent => :restrict
  has_many :consumers_providers, :dependent => :restrict
  has_many :consumers, :through => :consumers_providers
  has_many :ipaddresses, :dependent => :restrict
  has_many :fetchers, :dependent => :restrict
  accepts_nested_attributes_for :consumers_providers, :allow_destroy => true
  accepts_nested_attributes_for :packages, :allow_destroy => true
  accepts_nested_attributes_for :ipaddresses, :allow_destroy => true
  belongs_to :provider_type

  validates :code,  :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :provider_type, :presence => true

  scope :recent, :limit => 10, :order => 'created_at DESC'

  def name
    "#{description}"
  end
end
