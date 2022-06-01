class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @score = Score.where(user_id: current_user.id, bowling_center_id: params[:bowling_center_id])
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
  end

  def show
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.where(user_id: current_user.id, bowling_center_id: params[:bowling_center_id])
  end

  def new
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.new
  end

  def edit
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.find(params[:id])
  end

  def create
    @score = Score.new(score_params)
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score.bowling_center_id = @bowling_center.id
    @score.user_id = current_user.id

    respond_to do |format|
      if @score.save!
        format.html { redirect_to bowling_center_scores_path(@bowling_center), notice: "スコアを登録しました" }
        format.json { render :index, status: :created, location: @score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score.bowling_center_id = @bowling_center.id
    @score.user_id = current_user.id
    
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to bowling_center_scores_path(@bowling_center, @score), notice: "スコアを編集しました" }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @score.destroy

    respond_to do |format|
      format.html { redirect_to bowling_center_scores_path, notice: "スコアを削除しました" }
      format.json { head :no_content }
    end
  end

  private
    def set_score
      @score = Score.find(params[:id])
    end

    def score_params
      params.require(:score).permit(:point)
    end
end
