class FetcherAddRealm < ActiveRecord::Migration
  def up
    add_column :fetchers, :realm, :string
  end

  def down
    remove_column :fetchers, :realm
  end
end
