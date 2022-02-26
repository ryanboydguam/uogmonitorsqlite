class Networkpage < ApplicationRecord
    belongs_to :site
    accepts_nested_attributes_for :site #For all saves for networkpages it also saves to sites
    def offline?
        status == "Offline" 
    end
    def online?
        status == "Online" 
    end
    def maintenance?
        status == "Maintenance" 
    end
end
