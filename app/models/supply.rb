class Supply < ActiveRecord::Base
  attr_accessible :code

  has_many :fetchers, :dependent => :restrict

  validates :code,  :presence => true, :uniqueness => true

  def name
    I18n.t code, :scope => 'shohisha.code.supply'
  end

end
