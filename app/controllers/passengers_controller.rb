class PassengersController < ApplicationController
before_filter :authenticate_user!
	def create
		@carpool = Carpool.find(params[:carpool_id])
		
		@passenger = @carpool.passengers.build()
		@passenger.passenger = current_user.id
		seats = (@carpool.seats.first.seats) - 1
		if @passenger.save
		   @carpool.seats.first.update(:seats => seats )
		   flash[:alert]= "Carpool has been Booked"
		   #flash.now[:alert]= "Carpool has been Booked"

           redirect_to root_path
          end
	end
end
