class AddFetcherPortAndEncryption < ActiveRecord::Migration
  def up
    add_column :fetchers, :port, :integer
    add_column :fetchers, :encryption, :string
    add_column :transports, :uses_encryption, :boolean, :default => true,
      :null => false
    add_column :transports, :uses_port, :boolean, :default => true,
      :null => false
    add_column :transports, :uses_realm, :boolean, :default => true,
      :null => false
  end

  def down
    remove_column :fetchers, :port
    remove_column :fetchers, :encryption
    remove_column :transports, :uses_encryption
    remove_column :transports, :uses_port
  end
end
