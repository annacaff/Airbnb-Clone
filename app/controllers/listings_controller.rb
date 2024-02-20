class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/:id
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # POST /listings
  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # GET /listings/:id/edit
  def edit
    # Ensure only the listing owner or an admin can access the edit page
  end

  # PATCH/PUT /listings/:id
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/:id
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :description, :price, :location, :image, :availability)
    end
end
