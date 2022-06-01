class BowlingCentersController < ApplicationController
  before_action :set_bowling_center, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @bowling_centers = BowlingCenter.all
  end

  def show
    @bowling_center = BowlingCenter.find(params[:id])
    @score = Score.where(user_id: current_user.id, bowling_center_id: params[:bowling_center_id])
  end

  def new
    @bowling_center = BowlingCenter.new
  end

  def edit
    @bowling_center = BowlingCenter.find(params[:id])
  end

  def create
    @bowling_center = BowlingCenter.new(bowling_center_params)

    respond_to do |format|
      if @bowling_center.save
        format.html { redirect_to bowling_center_path(@bowling_center), notice: "ボウリング場を登録しました" }
        format.json { render :show, status: :created, location: @bowling_center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bowling_center.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bowling_center.update(bowling_center_params)
        format.html { redirect_to bowling_center_path(@bowling_center), notice: "ボウリング場を編集しました" }
        format.json { render :show, status: :ok, location: @bowling_center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bowling_center.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bowling_center.destroy

    respond_to do |format|
      format.html { redirect_to bowling_centers_path, notice: "ボウリング場を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    def set_bowling_center
      @bowling_center = BowlingCenter.find(params[:id])
    end

    def bowling_center_params
      params.require(:bowling_center).permit(:name, :address, :phone_number, :hp)
    end
end
