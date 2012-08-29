class CreateFetchers < ActiveRecord::Migration
  def change
    create_table :fetchers do |t|
      t.references :provider, :null => false
      t.references :status, :null => false
      t.references :transport, :null => false
      t.references :retain, :null => false
      t.string :username
      t.string :password
      t.string :basename
      t.string :directory
      t.string :seperator
      t.string :file_filter
      t.string :directory_filter
      t.string :format
      t.string :set
      t.string :set_limit
      t.string :charset
      t.integer :recursive
      t.boolean :remote_delete
      t.boolean :passive
      t.integer :timeout

      t.timestamps
    end
    add_index :fetchers, :provider_id
    add_index :fetchers, :status_id
    add_index :fetchers, :transport_id
    add_index :fetchers, :retain_id
  end
end
