class CreateConsumersProviders < ActiveRecord::Migration
  def change
    create_table :consumers_providers do |t|
      t.references :consumer, :null => false
      t.references :provider, :null => false
      t.references :fulltext, :null => false

      t.timestamps
    end
    add_index :consumers_providers, :consumer_id
    add_index :consumers_providers, :provider_id
    add_index :consumers_providers, :fulltext_id
  end
end
