class Provider < ActiveRecord::Base
  attr_accessible :description, :code, :consumers_providers_attributes, :packages_attributes,
    :ipaddresses_attributes, :provider_type_id

  has_many :packages, :dependent => :restrict
  has_many :consumers_providers, :dependent => :restrict
  has_many :consumers, :through => :consumers_providers
  has_many :ipaddresses, :dependent => :destroy
  has_many :fetchers, :dependent => :restrict
  has_many :supplies, :through => :fetchers
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

  def self.from_param(params)
    if params[:fetcher_id]
      return [Fetcher.find(params[:fetcher_id]).provider]
    elsif params[:consumer_id]
      return Consumer.find(params[:consumer_id]).providers
    elsif params[:package_id]
      return [Package.find(params[:package_id]).provider]
    elsif params[:provider_type_id]
      return Provider.where(:provider_type_id => params[:provider_type_id])
    end
    Provider.all
  end
end
