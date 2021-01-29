class FlightsController < ApplicationController
  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      if params[:from_airport_id].blank?
        flash.now[:alert] = "Departure airport is missing"
      elsif params[:to_airport_id].blank?
        flash.now[:alert] = "Destination airport is missing"
      elsif params[:pax].blank?
        flash.now[:alert] = "Please choose the number of passengers"
      elsif params[:from_airport_id] == params[:to_airport_id]
        flash.now[:alert] = "Departure airport has to be different from Destination"
      elsif params[:day].blank? || params[:month].blank? || params[:year].blank?
        flash.now[:alert] = "Date not completed"
      else
        @selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @available_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], scheduled_on: @selected_date.all_day)
      end
    end
  end
end
