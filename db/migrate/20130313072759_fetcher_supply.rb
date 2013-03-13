class FetcherSupply < ActiveRecord::Migration
  def up
    add_column :fetchers, :supply_id, :integer, :null => false, :default => 0
    add_index :fetchers, :supply_id
    add_index :fetchers, :deliver_period_id
    drop_table :providers_supplies
  end

  def down
    remove_index :fetchers, :supply_id
    remove_column :fetchers, :supply_id
    create_table :providers_supplies, :id => false do |t|
      t.references :provider, :null => false
      t.references :supply, :null => false
    end
  end
end
