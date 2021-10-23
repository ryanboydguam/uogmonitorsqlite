class AddSiteReferenceToNetworkpages < ActiveRecord::Migration[6.1]
  def change
    add_reference :networkpages, :site
  end
end
