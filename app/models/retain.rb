class Retain < ActiveRecord::Base
  attr_accessible :code, :description

  validates :code, :presence => true, :uniqueness => true
  validates :description, :presence => true
end
