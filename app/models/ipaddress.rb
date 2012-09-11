class Ipaddress < ActiveRecord::Base
  belongs_to :provider
  attr_accessible :address
  
  validates :address, :presence => true
end
