class AddLastseenToSites < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :lastseen, :integer
  end
end