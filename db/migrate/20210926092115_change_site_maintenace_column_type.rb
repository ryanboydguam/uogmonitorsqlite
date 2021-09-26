class ChangeSiteMaintenaceColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :sites, :maintenance, :boolean
  end
  def down
    change_column :sites, :maintenance, :integer
  end
end
