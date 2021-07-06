class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  def index
    stays_array = Lodging.find_by(id: params["format"]).stays
    reviews_array = []
    stays_array.each do |x|
      reviews_array.push(x.review)
    end
    @reviews = reviews_array
    @lodging =  Lodging.find_by(id: params["format"])
  end

  def show
    @stay_id =  params[:id]
  end

  def create
    stay = Stay.find_by(id: params[:review][:stay_id])
    new_review = Review.create(rate: params[:review][:rate], description: params[:review][:text], stay: stay)
    new_review.save!
    redirect_to review_path(new_review.id)

  end

  def new
    @stay_id = params["format"]
  end

  def edit
  end

  def update
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_review
    @lodging =  Lodging.find_by(id: params["format"])
    @review = Review.find_by(id: params["id"])
    #if @review == nil
    #  @review = Review.new
    #end
  end

  def review_params
    params.require(:review).permit(:id, :stay_id, :rate, :text)
  end
end
