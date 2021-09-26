class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :address
      t.string :user
      t.datetime :creation
      t.integer :delay
      t.integer :maintenance

      t.timestamps
    end
  end
end
