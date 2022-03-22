class Site < ApplicationRecord
    has_many :networkpages
    has_one :latest_ping,->{networkpages.last}, class_name: "Networkpage"
    scope :offline,->{ where(status: "Offline")}
    scope :online,->{ where(status: "Online")}
    scope :maintenance,->{ where(maintenance: false) }
    belongs_to :user
    before_save do |site|#switch for maintances. So if it is false then it will update the status
        unless site.maintenance?
            site.status = "Maintenance"
        end
    end
end
