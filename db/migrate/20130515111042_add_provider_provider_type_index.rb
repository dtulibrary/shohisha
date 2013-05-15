class AddProviderProviderTypeIndex < ActiveRecord::Migration
  def up
    add_index :providers, :provider_type_id
  end

  def down
    remove_index :providers, :provider_type_id
  end
end
