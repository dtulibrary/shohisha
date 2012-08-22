class CreateIpaddresses < ActiveRecord::Migration
  def change
    create_table :ipaddresses do |t|
      t.references :provider, :null => false
      t.string :ipaddress, :null => false

      t.timestamps
    end
    add_index :ipaddresses, :provider_id
  end
end
