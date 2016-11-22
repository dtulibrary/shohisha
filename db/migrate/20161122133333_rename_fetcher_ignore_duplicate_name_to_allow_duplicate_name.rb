class RenameFetcherIgnoreDuplicateNameToAllowDuplicateName < ActiveRecord::Migration
  def up
    rename_column :fetchers, :ignore_duplicate_name, :allow_duplicate_name
  end

  def down
    rename_column :fetchers, :allow_duplicate_name, :ignore_duplicate_name
  end
end
