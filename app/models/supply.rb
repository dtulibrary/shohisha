class Supply < ActiveRecord::Base
  attr_accessible :code

  has_and_belongs_to_many :providers

  validates :code,  :presence => true, :uniqueness => true

  def name
    I18n.t code, :scope => 'shohisha.code.supply'
  end

end
