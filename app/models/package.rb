class Package < ActiveRecord::Base
  belongs_to :provider
  attr_accessible :code, :description, :provider_id,
    :consumers_packages_attributes

  has_many :consumers_packages, :dependent => :restrict
  has_many :consumers, :through => :consumers_packages

  accepts_nested_attributes_for :consumers_packages, :allow_destroy => true

  validates :code,  :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :provider, :presence => true

  def name
    "#{description}"
  end

end
