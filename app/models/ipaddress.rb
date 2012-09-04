class Ipaddress < ActiveRecord::Base
  belongs_to :provider
  attr_accessible :address, :provider_id
  
  validates :address, :presence => true
  validates :provider, :presence => true
end
