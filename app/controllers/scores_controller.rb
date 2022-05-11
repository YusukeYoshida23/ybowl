class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]

  # GET /scores or /scores.json
  def index
    @scores = Score.all
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
  end

  # GET /scores/1 or /scores/1.json
  def show
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.where(user_id: current_user.id, bowling_center_id: params[:bowling_center_id])
  end

  # GET /scores/new
  def new
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score = Score.find(params[:id])
  end

  # POST /scores or /scores.json
  def create
    @score = Score.new(score_params)
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score.bowling_center_id = @bowling_center.id
    @score.user_id = current_user.id

    respond_to do |format|
      if @score.save!
        format.html { redirect_to bowling_center_scores_path(@bowling_center, @score), notice: "Score was successfully created." }
        format.json { render :index, status: :created, location: @score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1 or /scores/1.json
  def update
    @bowling_center = BowlingCenter.find(params[:bowling_center_id])
    @score.bowling_center_id = @bowling_center.id
    @score.user_id = current_user.id
    
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to bowling_center_score_path(@bowling_center, @score), notice: "Score was successfully updated." }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1 or /scores/1.json
  def destroy
    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url, notice: "Score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:point)
    end
end
