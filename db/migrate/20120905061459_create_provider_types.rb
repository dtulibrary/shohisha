class CreateProviderTypes < ActiveRecord::Migration
  def change
    create_table :provider_types do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
