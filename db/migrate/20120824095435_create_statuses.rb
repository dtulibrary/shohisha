class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :code, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
