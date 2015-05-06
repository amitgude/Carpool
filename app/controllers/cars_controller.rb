class CarsController < ApplicationController
    before_filter :find_car, only: [:show, :edit,:update, :destroy, :delete]

	def index
		@cars = Car.where(:user_id => current_user.id)
	end

	def new
		@car= current_user.cars.build
	end

	def create
    @car= current_user.cars.create(car_params)
    if @car.save
      flash[:alert]= "Your car has been created"
   	  redirect_to cars_path
    else
      @errors = @car.errors.full_messages
   	  render 'new'
    end
	end

  def show
     
  end

  def edit

  end

  def update
    if @car.update(car_params)
      flash[:alert]= "Your car has been updated"
    	redirect_to cars_path
    else
    	render 'edit'
    end
  end

  def delete

  end
  def destroy
     @car.destroy
     flash[:alert]= "Your car has been deleted"
     redirect_to cars_path
  end

	private

	def car_params
    params.require(:car).permit(:brand, :model, :color, :seats, :picture)
	end

	def find_car
    @car= Car.find(params[:id])
	end
end
