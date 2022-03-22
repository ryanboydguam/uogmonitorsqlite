class CreateColorselections < ActiveRecord::Migration[6.1]
  def change
    create_table :colorselections do |t|
      t.string :red
      t.string :blue
      t.string :green

      t.timestamps
    end
  end
end
