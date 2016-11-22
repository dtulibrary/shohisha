class TransportAddUsesAllowDuplicateName < ActiveRecord::Migration
  def up
    add_column :transports, :uses_allow_duplicate_name, :boolean, :default => true,
      :null => false
  end

  def down
    remove_column :transports, :uses_allow_duplicate_name
  end
end
