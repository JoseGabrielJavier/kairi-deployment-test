class ReviewsController < ApplicationController
  def new
    @review_type = params[:review_type]
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.new
  end
  
  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.new(review_params)

    if @review.save
      flash[:success] = "You can successfully create a review."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @review.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.find(params[:id]) 
  end

  def update  
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.find(params[:id]) 
    if @review.update(review_params)
      flash[:success] = "You can successfully edit a review."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @review.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def review_params
      params.require(:review).permit(:review_type, :comment, :star)
    end
end
