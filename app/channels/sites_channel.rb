class SitesChannel < ApplicationCable::Channel
    def follow(data)
       stream_from "sites:#{data["site_id"]}"
    end
  
    def unfollow
        stop_all_streams
    end
end