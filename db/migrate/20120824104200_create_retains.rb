class CreateRetains < ActiveRecord::Migration
  def change
    create_table :retains do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
