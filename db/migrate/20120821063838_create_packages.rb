class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :provider, :null => false
      t.string :code, :null => false
      t.text :description, :null => false

      t.timestamps
    end
    add_index :packages, :provider_id
  end
end
