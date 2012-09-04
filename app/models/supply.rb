class Supply < ActiveRecord::Base
  attr_accessible :code, :description, :id

  has_and_belongs_to_many :providers

  validates :code,  :presence => true, :uniqueness => true
  validates :description, :presence => true,
                    :length => { :minimum => 5 }
end
