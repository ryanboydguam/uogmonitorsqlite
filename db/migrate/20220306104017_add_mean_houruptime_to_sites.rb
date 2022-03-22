class AddMeanHouruptimeToSites < ActiveRecord::Migration[6.1]
    def change
      add_column :sites, :mean, :float
      add_column :sites, :houruptime, :integer
    end
end