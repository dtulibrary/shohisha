class Fulltext < ActiveRecord::Base
  attr_accessible :code

  validates :code,  :presence => true, :uniqueness => true

  has_many :consumers_packages, :dependent => :restrict
  has_many :packages, :through => :consumers_packages
  has_many :consumers_providers, :dependent => :restrict
  has_many :providers, :through => :consumers_providers
  has_many :consumers, :through => [:consumers_packages, :consumers_providers]

  def name
    I18n.t code, :scope => 'shohisha.code.fulltext'
  end

end
