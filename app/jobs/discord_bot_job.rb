class DiscordBotJob < ApplicationJob
    require 'discordrb'
    require 'net/ping'
    queue_as :default
    def perform(*args)
        puts "hello"
        Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
        bot = Discordrb::Commands::CommandBot.new token: 'ODcyMTgyMTE3MDg0MzExNjIy.YQmI5Q.wjgafluEvZ4T8Hl_kjhuks5OQa4'
        # bot.message(content: '!Setup') do |event|
        #     event.message.delete
        #     dcConstant = event.channel.name
        #     event.respond "test #{dcConstant}"
        # end
        bot.send_message(933711410230333471,"UOG MONITOR SYSTEM #{Time.now}")
        @sites = Site.all
        @sites.each_with_index.map do |site,i|
            # site_data_array = site.networkpages.last(2).pluck(:relaytime).reverse()
            array_status=site.networkpages.last(60).pluck(:status).reverse()
            last_seen_counter=0
            array_status_result=array_status.each_with_object(Hash.new(0)){|word,counts| counts[word]+=1}
            if array_status_result["Offline"] > 0
                array_status.each do |value|
                    last_seen_counter+=1
                    if value == "Offline"
                        break
                    end
                end
            end
            output=(array_status_result["Online"].to_f/(array_status_result["Online"].to_f+array_status_result["Offline"].to_f)*100).to_i

        bot.send_message(933711410230333471,"```#{site.address} UpTime: #{output} % Last Seen: #{last_seen_counter}```")
        end


        bot.send_message(933711410230333471,"Test Data")
    end
end