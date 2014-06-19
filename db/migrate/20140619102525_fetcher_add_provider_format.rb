class FetcherAddSleepInterval < ActiveRecord::Migration
  def up
    add_column :fetchers, :provider_format, :string
    add_column :transports, :uses_provider_format, :boolean, :default => true,
      :null => false
  end

  def down
    remove_column :fetchers, :provider_format
    remove_column :transports, :uses_provider_format
  end
end
