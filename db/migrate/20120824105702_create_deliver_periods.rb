class CreateDeliverPeriods < ActiveRecord::Migration
  def change
    create_table :deliver_periods do |t|
      t.string :code, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
