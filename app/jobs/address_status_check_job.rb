class AddressStatusCheckJob < ApplicationJob
  require 'net/ping'
  queue_as :default
  def perform(site)
    if site.maintenance?
      checkFloat = upURL(site.address, site.delay)
      tmpNetworkpage = site.networkpages.build # creates a new networkpage object
      if checkFloat == 5.0
        tmpNetworkpage.status = 'Offline'
        tmpNetworkpage.site.status = 'Offline'
      else
        tmpNetworkpage.status = 'Online'
        tmpNetworkpage.site.status = 'Online'
      end
      tmpNetworkpage.address = site.address
      tmpNetworkpage.addressindex = site.id
      tmpNetworkpage.monitor = 2
      tmpNetworkpage.relaytime = checkFloat
      tmpNetworkpage.creation = Time.now
      tmpNetworkpage.site = site
      site.mean=(site.networkpages.order(id: :desc).limit(60).average(:relaytime)).round(4)
      sitestatus=site.networkpages.last(60).pluck(:status).reverse
      site.lastseen=sitestatus.find_index {|status| status=="Online"}
      sitestatus_hash=sitestatus.each_with_object(Hash.new(0)){|word,counts| counts[word]+=1}

      site.houruptime=(sitestatus_hash["Online"].to_f/60.to_f)*100

      tmpNetworkpage.save

      ActionCable.server.broadcast("sites:#{site.id}", { siteId: site.id, htmlRender: SitesController.render(
        partial: 'sites/site', locals: { site: site }
      ), pingStatus: tmpNetworkpage.status })
      p tmpNetworkpage
      p '[UPDATE]'
    else
      tmpNetworkpage = site.networkpages.build # creates a new networkpage object
      tmpNetworkpage.status = false
      tmpNetworkpage.site.status = false
      tmpNetworkpage.address = site.address
      tmpNetworkpage.addressindex = site.id
      tmpNetworkpage.monitor = 2
      tmpNetworkpage.relaytime = 0
      tmpNetworkpage.creation = Time.now
      tmpNetworkpage.site = site
      site.mean=0
      site.lastseen=0
      site.houruptime=0
      tmpNetworkpage.save

      ActionCable.server.broadcast("sites:#{site.id}", { siteId: site.id, htmlRender: SitesController.render(
        partial: 'sites/site', locals: { site: site }
      ), pingStatus: tmpNetworkpage.status })
      p tmpNetworkpage
      p '[UPDATE]'
    end
  end
  def upURL(host, time)
    check = Net::Ping::HTTP.new(host, nil, time)
    if check.ping
      check.duration.round(4)
    else
      5.0
    end
  end
  def calculate_hour_up_time(site)
   # site.networkpages.order(id: :desc).limit(60).group_by(&:status).map {|k,v| [k, v.length]}
  end
end
