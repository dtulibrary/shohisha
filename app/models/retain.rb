class Retain < ActiveRecord::Base
  attr_accessible :code, :description

  validates :code, :presence => true, :uniqueness => true
  validates :description, :presence => true

  def name
    I18n.t code, :scope => 'shohisha.code.retain'
  end

end
