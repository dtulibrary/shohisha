class RemoveDescriptionFromCodeTables < ActiveRecord::Migration
  def up
    remove_column :deliver_periods, :description
    remove_column :fulltexts, :description
    remove_column :provider_types, :description
    remove_column :retains, :description
    remove_column :statuses, :description
    remove_column :supplies, :description
    remove_column :transports, :description
  end

  def down
  end
end
