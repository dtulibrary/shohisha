class FetcherAddIgnoreDuplicateName < ActiveRecord::Migration
  def up
    add_column :fetchers, :ignore_duplicate_name, :boolean, :default => true
  end

  def down
    remove_column :fetchers, :ignore_duplicate_name
  end
end
