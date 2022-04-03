class Networkpage < ApplicationRecord
    belongs_to :site
    accepts_nested_attributes_for :site #For all saves for networkpages it also saves to sites
    scope :between, ->(start_date,end_date) {where(created_at: (Time.zone.parse(start_date).beginning_of_day)..(Time.zone.parse(end_date).end_of_day)) }
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
