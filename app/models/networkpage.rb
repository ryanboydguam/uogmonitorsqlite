class Networkpage < ApplicationRecord
    belongs_to :site
    def offline?
        status == "Offline" 
    end
    def online?
        status == "Online" 
    end
end
