class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    game = Game.find(params[:game])
    @review = game.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      redirect_to root_path, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to root_path, notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:body, :score, :user_id, :game_id)
    end
end
