class Consumer < ActiveRecord::Base
  attr_accessible :code, :description, :consumers_providers_attributes, :consumers_packages_attributes
  
  has_many :consumers_providers, :dependent => :restrict
  has_many :providers, :through => :consumers_providers
  has_many :consumers_packages, :dependent => :restrict
  has_many :packages, :through => :consumers_packages
  
  accepts_nested_attributes_for :consumers_providers, :allow_destroy => true
  accepts_nested_attributes_for :consumers_packages, :allow_destroy => true

  validates :code,  :presence => true, :uniqueness => true
  validates :description, :presence => true

  scope :recent, :limit => 10, :order => 'created_at DESC'

  def name
    "#{description}"
  end

end
