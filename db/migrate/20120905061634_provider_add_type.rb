class ProviderAddType < ActiveRecord::Migration
  def up
     add_column :providers, :type_id, :integer, :null => false, :default => 1
  end

  def down
     drop_column :providers, :type_id
  end
end
