class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # GET /bookings/:id
  def show
  end

  # GET /bookings/:id/edit
  def edit
  end

  # PATCH/PUT /bookings/:id
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_count, :listing_id)
    end
end
