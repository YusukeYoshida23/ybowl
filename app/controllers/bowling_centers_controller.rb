class BowlingCentersController < ApplicationController
  before_action :set_bowling_center, only: %i[ show edit update destroy ]

  # GET /bowling_centers or /bowling_centers.json
  def index
    @bowling_centers = BowlingCenter.all
  end

  # GET /bowling_centers/1 or /bowling_centers/1.json
  def show
    @bowling_centers = BowlingCenter.all
  end

  # GET /bowling_centers/new
  def new
    @bowling_center = BowlingCenter.new
  end

  # GET /bowling_centers/1/edit
  def edit
  end

  # POST /bowling_centers or /bowling_centers.json
  def create
    @bowling_center = BowlingCenter.new(bowling_center_params)

    respond_to do |format|
      if @bowling_center.save
        format.html { redirect_to bowling_center_url(@bowling_center), notice: "Bowling center was successfully created." }
        format.json { render :show, status: :created, location: @bowling_center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bowling_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bowling_centers/1 or /bowling_centers/1.json
  def update
    respond_to do |format|
      if @bowling_center.update(bowling_center_params)
        format.html { redirect_to bowling_center_url(@bowling_center), notice: "Bowling center was successfully updated." }
        format.json { render :show, status: :ok, location: @bowling_center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bowling_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bowling_centers/1 or /bowling_centers/1.json
  def destroy
    @bowling_center.destroy

    respond_to do |format|
      format.html { redirect_to bowling_centers_url, notice: "Bowling center was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bowling_center
      @bowling_center = BowlingCenter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bowling_center_params
      params.require(:bowling_center).permit(:name, :address, :phone_number, :hp)
    end
end
