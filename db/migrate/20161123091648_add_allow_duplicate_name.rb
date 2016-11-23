class AddAllowDuplicateName < ActiveRecord::Migration
  def up
     remove_column :fetchers, :ignore_duplicate_name
     remove_column :transports, :uses_ignore_duplicate_name
     add_column :fetchers, :allow_duplicate_name, :boolean, :default => false
     add_column :transports, :uses_allow_duplicate_name, :boolean, :default => true, :null => false
  end

  def down
     add_column :fetchers, :ignore_duplicate_name, :boolean, :default => true
     add_column :transports, :uses_ignore_duplicate_name, :boolean, :default => true, :null => false
     remove_column :fetchers, :allow_duplicate_name
     remove_column :transports, :uses_allow_duplicate_name
  end
end
