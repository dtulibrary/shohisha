class DeliverPeriod < ActiveRecord::Base
  attr_accessible :code

  validates :code, :presence => true, :uniqueness => true

  def name
    I18n.t code, :scope => 'shohisha.code.deliver_period'
  end
end
