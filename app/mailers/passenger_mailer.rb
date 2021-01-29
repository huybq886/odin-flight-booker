class PassengerMailer < ApplicationMailer
  default from: 'thenks@example.com'

  def thankyou_email(passenger)
    @passenger = passenger
    @selected_flight = passenger.booking.flight
    @flight_id = @selected_flight.id
    @departure = @selected_flight.from_airport.code
    @arrival = @selected_flight.to_airport.code
    @departure_date = @selected_flight.scheduled_on.strftime('%B %d, %Y')
    @departure_time = @selected_flight.scheduled_on.strftime('%H:%M')
    @arrival_time = (@selected_flight.scheduled_on + (@selected_flight.duration/60).to_i.hours).strftime('%H:%M')

    mail(to: passenger.email, subject: 'Thank You for Booking a Flight With Us')
  end
end