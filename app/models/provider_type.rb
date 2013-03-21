class ProviderType < ActiveRecord::Base
  attr_accessible :code

  validates :code, :presence => true, :uniqueness => true

  def name
    I18n.t code, :scope => 'shohisha.code.provider_type'
  end

end
