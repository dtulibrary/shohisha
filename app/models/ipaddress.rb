class Ipaddress < ActiveRecord::Base
  belongs_to :provider
  attr_accessible :ipaddress
end
