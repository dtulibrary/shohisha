class CreateProvidersSupplies < ActiveRecord::Migration
  def up
    create_table :providers_supplies, :id => false do |t|
      t.references provider, :null => false
      t.references supply, :null => false
    end
  end

  def down
    drop table :provider_supplies
  end
end
