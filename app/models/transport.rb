class Transport < ActiveRecord::Base
  attr_accessible :code, :description, :uses_basename, :uses_charset,
    :uses_directory, :uses_directory_filter, :uses_file_filter,
    :uses_format, :uses_passive, :uses_password, :uses_recursive,
    :uses_remote_delete, :uses_seperator, :uses_set, :uses_set_limit,
    :uses_timeout, :uses_username

  validates :code, :presence => true, :uniqueness => true
  validates :description, :presence => true
end
