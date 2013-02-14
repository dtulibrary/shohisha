class User < ActiveRecord::Base
  devise :cas_authenticatable

  attr_accessible :username
end
