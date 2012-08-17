class Supply < ActiveRecord::Base
  attr_accessible :code, :description, :id

  validates :code,  :presence => true
  validates :description, :presence => true,
                    :length => { :minimum => 5 }
end
