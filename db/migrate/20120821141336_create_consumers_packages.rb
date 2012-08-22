class CreateConsumersPackages < ActiveRecord::Migration
  def change
    create_table :consumers_packages do |t|
      t.references :consumer
      t.references :package
      t.references :fulltext

      t.timestamps
    end
    add_index :consumers_packages, :consumer_id
    add_index :consumers_packages, :package_id
    add_index :consumers_packages, :fulltext_id
  end
end
