class ReviewsController < ApplicationController
  before_action :set_listing, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /listings/:listing_id/reviews/new
  def new
    @review = Review.new
  end

  # POST /listings/:listing_id/reviews
  def create
    @review = @listing.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @listing, notice: 'Review was successfully created.'
    else
      render :new
    end
  end


  private

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
