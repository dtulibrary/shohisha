class Retain < ActiveRecord::Base
  attr_accessible :code

  validates :code, :presence => true, :uniqueness => true

  has_many :fetchers, :dependent => :restrict

  def name
    I18n.t code, :scope => 'shohisha.code.retain'
  end

end
