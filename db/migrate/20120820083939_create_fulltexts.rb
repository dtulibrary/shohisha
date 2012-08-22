class CreateFulltexts < ActiveRecord::Migration
  def change
    create_table :fulltexts do |t|
      t.string :code, :null => false
      t.text :description, :null => false

      t.timestamps
    end
  end
end
