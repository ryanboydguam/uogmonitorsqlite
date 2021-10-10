def follow(data)
    p data, "FOLLOWING REQUEST"
    stream_from "networkpages:#{data['networkpage_id']}"
  end
  
  def unfollow
    stop_all_streams
  end