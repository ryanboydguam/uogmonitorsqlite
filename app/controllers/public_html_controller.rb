class PublicHtmlController < ApplicationController
  # GET /networkpages or /networkpages.json
  # def retro_wave_color(int)
  #   retro_colors = ['255,211,25','255,144,31','255,41,117','199,0,181','176,0,255','45,226,230','3,94,232','246,1,157','212,0,120','151,0,204','7,207,246','42,32,74','194,51,180','120,54,159','218,217,224','235,128,113','221,84,110','146,64,110','32,33,70','23,12,50','']
  #   return retro_colors[int]
  # end
  def retro_wave_color(int)
    @colorselections = Colorselection.all
    r=@colorselections[int].red.to_s
    b=@colorselections[int].blue.to_s
    g=@colorselections[int].green.to_s
    retro_colors =""
    retro_colors = retro_colors+r+","+g+","+b
    puts retro_colors
   return retro_colors
  end
  def index
    @colorselections = Colorselection.all
    @networkpages = Networkpage.all
    @sites = Site.all
    time_labels = (60.minutes.ago.to_i..Time.now.to_i).step(1.minute).to_a.reverse.map { |h| Time.at(h).strftime("%H:%M") }
    datasets = 
    @sites.each_with_index.map do |site,i| 
    {
    label: site.address ,
    data: site.networkpages.last(60).pluck(:relaytime).reverse(),
    borderColor: "rgb(#{retro_wave_color(site.id)})"
    }
    end
    @chartdata = {
      type: "line",
      data: {
        labels: time_labels,
        datasets: datasets
      },
      options: {
        legend: {
          display: false
        },
        scales: {
          y: {
            ticks: {
              beginAtZero: true
            }
          }
        }
      }
    }.to_json 

    
  end  
end
