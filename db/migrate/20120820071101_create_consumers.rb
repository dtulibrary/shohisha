class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :code, :null => false
      t.text :description, :null => false

      t.timestamps
    end
  end
end
