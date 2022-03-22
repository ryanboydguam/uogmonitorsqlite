class AddUserToSite < ActiveRecord::Migration[6.1]
    def change
      add_reference :sites, :user
    end
end