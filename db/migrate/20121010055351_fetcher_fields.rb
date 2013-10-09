class FetcherFields < ActiveRecord::Migration
  def up
    add_column :transports, :uses_basename, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_charset, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_directory, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_directory_filter, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_file_filter, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_format, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_passive, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_password, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_recursive, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_remote_delete, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_seperator, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_set, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_set_limit, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_timeout, :boolean, :null => false,
      :default => true
    add_column :transports, :uses_username, :boolean, :null => false,
      :default => true
  end

  def down
    remove_column :transports, :uses_basename
    remove_column :transports, :uses_charset
    remove_column :transports, :uses_directory
    remove_column :transports, :uses_directory_filter
    remove_column :transports, :uses_file_filter
    remove_column :transports, :uses_format
    remove_column :transports, :uses_passive
    remove_column :transports, :uses_password
    remove_column :transports, :uses_recursive
    remove_column :transports, :uses_remote_delete
    remove_column :transports, :uses_seperator
    remove_column :transports, :uses_set
    remove_column :transports, :uses_set_limit
    remove_column :transports, :uses_timeout
    remove_column :transports, :uses_username
  end
end
