class Fulltext < ActiveRecord::Base
  attr_accessible :code, :description
  
  validates :code,  :presence => true
  validates :description, :presence => true
end
