class SitesController < ApplicationController
  before_action :set_site, only: %i[ show edit update destroy ]

  # GET /sites or /sites.json
  def index
    @sites = Site.all
    @colorselections = Colorselection.all
  end

  # GET /sites/1 or /sites/1.json
  def show
    @networkpages = @site.networkpages.order(created_at: :desc)
    if params[:start_date].present? && params[:end_date].present?
      @networkpages= @networkpages.between(params[:start_date],params[:end_date])
    else
      @networkpages=@networkpages.limit(1440)
    end
    @colorselections = Colorselection.all
  end
  

  # GET /sites/new
  def new
    @site = Site.new
    @site.user=current_user
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: "Site was successfully created." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: "Site was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: "Site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:address, :user_id, :creation, :delay, :maintenance)
    end
end
