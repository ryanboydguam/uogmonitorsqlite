class Site < ApplicationRecord
    has_many :networkpages
    has_one :latest_ping,->{networkpages.last}, class_name: "Networkpage"
    scope :offline,->{ joins(:networkpages).where(networkpages:{status: "Offline"}).distinct }
    scope :online,->{ joins(:networkpages).where(networkpages:{status: "Online"}).distinct}
    scope :maintenance,->{ where(maintenance: false) }
end
