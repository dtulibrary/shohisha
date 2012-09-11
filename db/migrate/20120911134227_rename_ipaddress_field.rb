class RenameIpaddressField < ActiveRecord::Migration
  def up
    rename_column :ipaddresses, :ipaddress, :address
  end

  def down
    rename_column :ipaddresses, :address, :ipaddress
  end
end
