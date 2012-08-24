class CreateRetains < ActiveRecord::Migration
  def change
    create_table :retains do |t|
      t.string :code, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
