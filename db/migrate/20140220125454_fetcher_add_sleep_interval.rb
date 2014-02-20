class FetcherAddSleepInterval < ActiveRecord::Migration
  def up
    add_column :fetchers, :sleep_interval, :integer
    add_column :transports, :uses_sleep_interval, :boolean, :default => true,
      :null => false
  end

  def down
    remove_column :fetchers, :sleep_interval
    remove_column :transports, :uses_sleep_interval
  end
end
