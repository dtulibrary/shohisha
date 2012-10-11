class AddDeliverPeriod < ActiveRecord::Migration
  def up
    add_column :fetchers, :deliver_period_id, :integer
  end

  def down
    drop_column :fetchers, :deliver_period_id
  end
end
