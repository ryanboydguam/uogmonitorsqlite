class CreateSslChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :ssl_checks do |t|
      t.integer :addressindex
      t.integer :monitor
      t.string :status
      t.datetime :creation

      t.timestamps
    end
  end
end
