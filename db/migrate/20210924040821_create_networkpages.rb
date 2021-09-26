class CreateNetworkpages < ActiveRecord::Migration[6.1]
  def change
    create_table :networkpages do |t|
      t.string :address
      t.integer :addressindex
      t.integer :monitor
      t.string :status
      t.float :relaytime
      t.datetime :creation

      t.timestamps
    end
  end
end
