class BookingsController < ApplicationController
  def new
    if params.has_key?(:flight_id)
      @booking = Booking.new
      @selected_flight = Flight.find(params[:flight_id])
      params[:pax].to_i.times do
        @booking.passengers.build
      end
    else
      flash.alert = 'No flight selected ><'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash.notice = 'Booking successfully completed!'

      @booking.passengers.each do |passenger|
        PassengerMailer.thankyou_email(passenger).deliver_now
      end

      redirect_to booking_path(@booking)
    else
      flash.alert = 'Booking not complete =('
      render :new
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
