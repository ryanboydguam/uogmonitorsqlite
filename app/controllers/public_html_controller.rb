class PublicHtmlController < ApplicationController
  # GET /networkpages or /networkpages.json
  def index
    @networkpages = Networkpage.all
    @sites = Site.all
  end  
end
