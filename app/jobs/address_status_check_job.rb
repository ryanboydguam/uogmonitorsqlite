class AddressStatusCheckJob < ApplicationJob
require 'net/ping'
  queue_as :default
    def perform(*args)
      tmpSites = Site.all #loads all the site data in

      tmpSites.each do |x| #for each site on the site page
        if x.maintenance?
          checkFloat = upURL(x.address,x.delay)
          tmpNetworkpage = Networkpage.new#creates a new networkpage object
          if checkFloat == 5.0
            tmpNetworkpage.status = "Offline"
          else
            tmpNetworkpage.status = "Online"
          end
          tmpNetworkpage.address = x.address
          tmpNetworkpage.addressindex = x.id
          tmpNetworkpage.monitor = 2
          tmpNetworkpage.relaytime = checkFloat
          tmpNetworkpage.creation = Time.now
          tmpNetworkpage.save
          ActionCable.server.broadcast("sites:#{x.id}",{eventnetwork: tmpNetworkpage,siteId: x.id})
          p tmpNetworkpage
          p "[UPDATE]"
        end
      end
    end
    def upURL(host,time)
      check = Net::Ping::HTTP.new(host, nil, time)
      if check.ping
        return check.duration.round(4)
      else
        return 5.0
      end
    end
end
