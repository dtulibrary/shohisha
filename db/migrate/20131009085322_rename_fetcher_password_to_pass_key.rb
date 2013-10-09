class RenameFetcherPasswordToPassKey < ActiveRecord::Migration
  def up
    rename_column :fetchers, :password, :passkey
    rename_column :transports, :uses_password, :uses_passkey
  end

  def down
    rename_column :fetchers, :passkey, :password
    rename_column :transports, :uses_passkey, :uses_password
  end
end
