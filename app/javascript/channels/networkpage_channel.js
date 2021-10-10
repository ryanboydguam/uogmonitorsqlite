import consumer from "./consumer";
//Gets information from the consumer channel

consumer.subscriptions.create("NetworkpagesChannel", {
  collection() {
    return document.querySelector("[network-pipe='servers']");
  },

  connected() {
    console.log("CONNECTED");
    setTimeout(() => {
      console.log("PING");
      this.followServers();
      this.followServersCallback();
    }, 1000);
  },

  disconnected() {
    console.log("DISCONNECTED");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data, "FOOO");
    this.collection().querySelector(`[network-pipe='${data.id}']`)
      .outerHTML = data.server;
  },

  followServers() {
    console.log("FOLLOWING");
    var results, servers;
    if (typeof this.collection() == "undefined") {
      console.log("UNFOLLOWING");
      return this.perform("unfollow");
    } else {
      console.log(this.collection(), "HEHEH");

      servers = Array.from(this.collection().children).map((server) => {
        return server.dataset["server"];
      });
      if (servers.length > 0) {
        results = [];
        servers.forEach((serverId) => {
          console.log("FOLLOWING ID ", serverId);
          results.push(
            this.perform("follow", {
              server_id: serverId,
            })
          );
        });
        return results;
      } else {
        console.log("UNFOLLOWING CUS");
        return this.perform("unfollow");
      }
    }
  },

  followServersCallback() {
    console.log("CALLBACK");
    document.addEventListener("turbolinks:load", () => {
      this.followServers();
    });
  },
});
