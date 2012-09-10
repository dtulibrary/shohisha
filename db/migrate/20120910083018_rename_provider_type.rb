class RenameProviderType < ActiveRecord::Migration
  def up
    rename_column :providers, :type_id, :provider_type_id
  end

  def down
    rename_column :providers, :provider_type_id, :type_id
  end
end
