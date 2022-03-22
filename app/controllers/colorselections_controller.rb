class ColorselectionsController < ApplicationController
  before_action :set_colorselection, only: %i[ show edit update destroy ]

  # GET /colorselections or /colorselections.json
  def index
    @colorselections = Colorselection.all
  end

  # GET /colorselections/1 or /colorselections/1.json
  def show
  end

  # GET /colorselections/new
  def new
    @colorselection = Colorselection.new
  end

  # GET /colorselections/1/edit
  def edit
  end

  # POST /colorselections or /colorselections.json
  def create
    @colorselection = Colorselection.new(colorselection_params)

    respond_to do |format|
      if @colorselection.save
        format.html { redirect_to colorselection_url(@colorselection), notice: "Colorselection was successfully created." }
        format.json { render :show, status: :created, location: @colorselection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @colorselection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colorselections/1 or /colorselections/1.json
  def update
    respond_to do |format|
      if @colorselection.update(colorselection_params)
        format.html { redirect_to colorselection_url(@colorselection), notice: "Colorselection was successfully updated." }
        format.json { render :show, status: :ok, location: @colorselection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @colorselection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colorselections/1 or /colorselections/1.json
  def destroy
    @colorselection.destroy

    respond_to do |format|
      format.html { redirect_to colorselections_url, notice: "Colorselection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colorselection
      @colorselection = Colorselection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colorselection_params
      params.require(:colorselection).permit(:red, :blue, :green)
    end
end
