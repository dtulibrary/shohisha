class DeviseCreateUsers < ActiveRecord::Migration

  def self.up
    create_table(:users) do |t|
      ## CAS authenticable
      t.string   :username, :null => false

      t.timestamps
    end

    add_index :users, :username,             :unique => true
  end
end
