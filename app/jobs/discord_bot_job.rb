class DiscordBotJob < ApplicationJob
    require 'discordrb'
    require 'net/ping'
    queue_as :default
    def perform(*args)
        Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
        bot = Discordrb::Commands::CommandBot.new token: 'Njc4MjYyMjY5NjQwOTY2MTk0.XkgO9g.RzSJg9YBC6_kS2s4FzyIuz5aGok'
        # bot.message(content: '!Setup') do |event|
        #     event.message.delete
        #     dcConstant = event.channel.name
        #     event.respond "test #{dcConstant}"
        # end
        channel_id=933711410230333471
        if time.min >0 &&time.min < 2
        bot.send_message(channel_id,"UOG MONITOR SYSTEM :ONLINE")
            @sites.each_with_index.map do |site,i|
                bot.send_message(channel_id,"#{site.address} IS CURRENTLY #{site.status}")
                sleep(1)
            end
        end
        @sites = Site.all
        @sites.each_with_index.map do |site,i|
            if site.houruptime < 90 && site.status == "Offline"
                bot.send_message(channel_id,"#{site.address} IS CURRENTLY #{site.status}")
                bot.send_message(channel_id,"#{site.address} Was last seen #{site.lastseen} Minutes Ago")
            end
            if site.status == "Offline"
                bot.send_message(channel_id,"#{site.address} IS CURRENTLY #{site.status}")
                bot.send_message(channel_id,"THIS DOES NOT MEAN IT IS DOWN")
            end
        end
    end
end