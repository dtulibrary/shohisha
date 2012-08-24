class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
