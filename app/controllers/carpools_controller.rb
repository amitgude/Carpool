class CarpoolsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :find]
  before_action :find_carpool, :only => [:edit, :destroy, :update]
  def index
  	@carpools = Carpool.order("created_at DESC")
    @testimonials = Testimonial.all.order("created_at DESC")
  end

  def new
  	@carpool = current_user.carpools.build
  	@carpool.source.build
  	@carpool.destination.build
  	@carpool.seats.build
  	@carpool.preferences.build
  end

  def mypassengers
    @passengers= Carpool.find(params[:carpool_id]).passengers
  end


  def edit
    
  end

  def update
    #@carpool = current_user.carpools.build
    if @carpool.update(carpool_params)
      flash[:alert]= "Your carpool has been update"
      redirect_to @carpool
    else
      render('edit')
    end
  end

  def destroy
    @carpool.destroy
    flash[:alert]= "Your carpool has been deleted"
    redirect_to root_path
  end


  def create
  	@carpool= current_user.carpools.build(carpool_params)

  	if @carpool.save
      flash[:alert]= "Your carpool has been created"
  		redirect_to root_path
  	else
  		render 'new'
  	end

  end

  def find
    @source = params[:source]
    @destination = params[:destination]
    @carpools = Carpool.where("journey_date > ?", Date.today).where("user_id != ?",current_user.id)
    @location = Geocoder.coordinates(params[:source])
    #@location2 = Geocoder.coordinates(params[:destination])
   # @slat = @location[0]
    #@slong = @location[1]
    #@dlat = @location2[0]
    #@dlong = @location2[1] 
   # render :json => (@location[1])
  end

  def show
     @carpool= Carpool.find(params[:id])
     @sred = "No smoking" 
     @syellow = "Depends On the situation. Ask me"
     @sgreen = "You can smoke"
     @pred = "No pets please. Sorry" 
     @pyellow = "Depends On the pet. Ask me first"
     @pgreen = "All pets are welcome"
     @fred = "No eating in car" 
     @fyellow = "No crumbs in the car please. Eat neat"
     @fgreen = "Eat whenever you like"
     @mred = "I like a Quite ride" 
     @myellow = "Depends On the Kind of Music" 
     @mgreen = "I enjoy all kinds of music"

  end


  def rides
    @rides = current_user.carpools.order("updated_at DESC")
    @passengers = Passenger.where(:passenger => current_user.id)
     @location = current_user.locations.build
  end

private
 
 def carpool_params
 	params.require(:carpool).permit(:journey_date, :car_id, :luggage_size, :depature_time, :price, :other, source_attributes: [:id,:_destroy,:source, :lattitude, :longitude],destination_attributes: [:id,:_destroy,:destination, :lattitude, :longitude],seats_attributes: [:id,:_destroy,:seats], preferences_attributes: [:id,:_destroy,:music, :pets, :smoking, :ladies, :food])
 end

 def find_carpool
   @carpool =Carpool.find(params[:id])
   
 end

end
