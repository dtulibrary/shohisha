class RenameAllowDuplicateNameToIgnoreDuplicateName < ActiveRecord::Migration
  def up
    rename_column :fetchers, :allow_duplicate_name, :ignore_duplicate_name
    rename_column :transports, :uses_allow_duplicate_name, :uses_ignore_duplicate_name
  end

  def down
    rename_column :fetchers, :ignore_duplicate_name, :allow_duplicate_name
    rename_column :transports, :uses_ignore_duplicate_name, :uses_allow_duplicate_name
  end
end
