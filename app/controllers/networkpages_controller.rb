class NetworkpagesController < ApplicationController
  before_action :set_networkpage, only: %i[ show edit update destroy ]

  # GET /networkpages or /networkpages.json
  def index
    
    @networkpages = Networkpage.all
    @sites = Site.all
  end

  # GET /networkpages/1 or /networkpages/1.json
  def show
  end

  # GET /networkpages/new
  def new
    @networkpage = Networkpage.new
  end

  # GET /networkpages/1/edit
  def edit
  end

  # POST /networkpages or /networkpages.json
  def create
    @networkpage = Networkpage.new(networkpage_params)

    respond_to do |format|
      if @networkpage.save
        format.html { redirect_to @networkpage, notice: "Networkpage was successfully created." }
        format.json { render :show, status: :created, location: @networkpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @networkpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networkpages/1 or /networkpages/1.json
  def update
    respond_to do |format|
      if @networkpage.update(networkpage_params)
        format.html { redirect_to @networkpage, notice: "Networkpage was successfully updated." }
        format.json { render :show, status: :ok, location: @networkpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @networkpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networkpages/1 or /networkpages/1.json
  def destroy
    @networkpage.destroy
    respond_to do |format|
      format.html { redirect_to networkpages_url, notice: "Networkpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_networkpage
      @networkpage = Networkpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def networkpage_params
      params.require(:networkpage).permit(:address, :addressindex, :monitor, :status, :relaytime, :creation)
    end
end
