
class NetworkpagesChannel < ApplicationCable::Channel
    def follow(data)
        p data, "FOLLOWING REQUEST"
       stream_from "networkpages"
    end

    def unfollow
        stop_all_streams
    end
end