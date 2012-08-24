class Fetcher < ActiveRecord::Base
  belongs_to :provider
  belongs_to :status
  belongs_to :transport
  belongs_to :retain
  attr_accessible :basename, :charset, :directory, :directory_filter, :file_filter, :format, :passive, :password, :recursive, :remote_delete, :seperator, :set, :set_limit, :timeout, :username
end
