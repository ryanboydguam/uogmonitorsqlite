class SslChecksController < ApplicationController
  before_action :set_ssl_check, only: %i[ show edit update destroy ]

  # GET /ssl_checks or /ssl_checks.json
  def index
    @ssl_checks = SslCheck.all
  end

  # GET /ssl_checks/1 or /ssl_checks/1.json
  def show
  end

  # GET /ssl_checks/new
  def new
    @ssl_check = SslCheck.new
  end

  # GET /ssl_checks/1/edit
  def edit
  end

  # POST /ssl_checks or /ssl_checks.json
  def create
    @ssl_check = SslCheck.new(ssl_check_params)

    respond_to do |format|
      if @ssl_check.save
        format.html { redirect_to @ssl_check, notice: "Ssl check was successfully created." }
        format.json { render :show, status: :created, location: @ssl_check }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ssl_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssl_checks/1 or /ssl_checks/1.json
  def update
    respond_to do |format|
      if @ssl_check.update(ssl_check_params)
        format.html { redirect_to @ssl_check, notice: "Ssl check was successfully updated." }
        format.json { render :show, status: :ok, location: @ssl_check }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ssl_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssl_checks/1 or /ssl_checks/1.json
  def destroy
    @ssl_check.destroy
    respond_to do |format|
      format.html { redirect_to ssl_checks_url, notice: "Ssl check was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssl_check
      @ssl_check = SslCheck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ssl_check_params
      params.require(:ssl_check).permit(:addressindex, :monitor, :status, :creation)
    end
end
