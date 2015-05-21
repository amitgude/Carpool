class PassengersController < ApplicationController

before_filter :authenticate_user!
	def index
		@passenger = Passenger.where(:passenger =>  current_user.id)
	end

	def create
		@carpool = Carpool.find(params[:carpool_id])
		
		@passenger = @carpool.passengers.build()
		@passenger.passenger = current_user.id
		seats = (@carpool.seats.first.seats) - 1
		if @passenger.save
			#Notify_mail.sample_email(current_user).deliver
		   @carpool.seats.first.update(:seats => seats )
		   flash[:alert]= "Carpool has been Booked"
		   #flash.now[:alert]= "Carpool has been Booked"

           redirect_to root_path
          end
	end

	def destroy
    passenger = Passenger.where(:passenger => params[:id])
    seats = Seat.where(:carpool_id => params[:carpool_id])
    total_seats = seats.first.seats + 1
    seats.first.seats = total_seats
    seats.first.save
	passenger.first.destroy
	flash[:alert]= "your booking is canceled"
	redirect_to root_path
	end
	
end
