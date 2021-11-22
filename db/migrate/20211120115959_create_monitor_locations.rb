class CreateMonitorLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :monitor_locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :modified_by,foreign_key: {
        to_table: :users
      }
      t.timestamps
    end
  end
end
