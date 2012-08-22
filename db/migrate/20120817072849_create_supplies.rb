class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.primary_key :id
      t.string :code, :limit => 10, :null => false
      t.text :description, :null => false

      t.timestamps
    end
  end
end
