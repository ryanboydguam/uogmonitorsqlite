class AddressStatusCheckJob < ApplicationJob
require 'net/ping'
  queue_as :default
    def perform(*args)
      tmpSites = Site.all #loads all the site data in

      tmpSites.each do |x| #for each site on the site page
        if x.maintenance?
          checkFloat = upURL(x.address,x.delay)
          tmpNetworkpage = x.networkpages.build#creates a new networkpage object
          if checkFloat == 5.0
            tmpNetworkpage.status = "Offline"
            tmpNetworkpage.site.status = "Offline"
          else
            tmpNetworkpage.status = "Online"
            tmpNetworkpage.site.status = "Online"
          end
          tmpNetworkpage.address = x.address
          tmpNetworkpage.addressindex = x.id
          tmpNetworkpage.monitor = 2
          tmpNetworkpage.relaytime = checkFloat
          tmpNetworkpage.creation = Time.now
          tmpNetworkpage.site = x
          tmpNetworkpage.save
          
          ActionCable.server.broadcast("sites:#{x.id}",{siteId: x.id,htmlRender: SitesController.render(
            partial: 'sites/site', locals: { site: x }
          ),pingStatus: tmpNetworkpage.status
          
          })
          p tmpNetworkpage
          p "[UPDATE]"
        else
          
          # tmpNetworkpage = Networkpage.new#creates a new networkpage object
          # tmpNetworkpage.status = "Maintenance"
          # tmpNetworkpage.site.status = "Maintenance"
          # tmpNetworkpage.address = x.address
          # tmpNetworkpage.addressindex = x.id
          # tmpNetworkpage.monitor = 2
          # tmpNetworkpage.relaytime = 0
          # tmpNetworkpage.creation = Time.now
          # tmpNetworkpage.site = x
          # tmpNetworkpage.save
          
          # ActionCable.server.broadcast("sites:#{x.id}",{siteId: x.id,htmlRender: SitesController.render(
          #   partial: 'sites/site', locals: { site: x }
          # ),pingStatus: tmpNetworkpage.status
          
          # })
          # p tmpNetworkpage
          # p "[UPDATE]"
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
