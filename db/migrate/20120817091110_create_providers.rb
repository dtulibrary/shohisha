class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :short_name
      t.string :long_name

      t.timestamps
    end

    add_index :relationships, :short_name, :unique: true
  end
end
