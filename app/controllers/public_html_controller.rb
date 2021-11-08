class PublicHtmlController < ApplicationController
  # GET /networkpages or /networkpages.json
  def index
    @networkpages = Networkpage.all
    @sites = Site.all
    

    time_labels = (60.minutes.ago.to_i..Time.current.to_i).step(1.minute).map { |h| Time.at(h).strftime("%H:%M") }
    datasets = 
    @sites.map do |site| 
    {
    label: site.address ,
    data: site.networkpages.last(60).pluck(:relaytime),
    borderColor: 'rgb(255, 99, 132)'
    }
    end
    
  

    @chartdata = {
      type: "line",
      data: {
        labels: time_labels,
        datasets: datasets
      },

      options: {
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
