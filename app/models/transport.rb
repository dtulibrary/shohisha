class Transport < ActiveRecord::Base
  attr_accessible :code, :uses_basename, :uses_charset,
    :uses_directory, :uses_directory_filter, :uses_file_filter,
    :uses_format, :uses_passive, :uses_passkey, :uses_recursive,
    :uses_remote_delete, :uses_seperator, :uses_set, :uses_set_limit,
    :uses_timeout, :uses_username, :uses_realm, :uses_encryption,
    :uses_port

  has_many :fetchers, :dependent => :restrict

  validates :code, :presence => true, :uniqueness => true

  def name
    I18n.t code, :scope => 'shohisha.code.transport'
  end

  def self.transport(field)
    list = "transportall"
    all.each do |transport|
      if transport.send("uses_#{field}") == true
        list << " transport#{transport.id}"
      end
    end
    list
  end

end
