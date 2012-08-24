class CreateDeliverPeriods < ActiveRecord::Migration
  def change
    create_table :deliver_periods do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
