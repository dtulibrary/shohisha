class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :code, :limit => 30, :null => false
      t.string :description, null => false

      t.timestamps
    end

    add_index :providers, :code, :unique => true
  end
end
