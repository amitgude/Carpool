class TestimonialsController < ApplicationController
	before_action :find_testimonial , :only => [:edit, :update, :destroy]
    def index
    	@testimonials=Testimonial.where(:user_id => current_user.id)
        @testimonial = current_user.testimonials.build
    end

	def create
        @testimonial = current_user.testimonials.create(testimonial_params)
        if @testimonial.save
            flash[:alert]= "Your testimonial has posted"
            redirect_to testimonials_path
        else
          flash[:alert]= "Your message cant be blank"
             redirect_to testimonials_path
        end
	end

	def new
     @testimonial = current_user.testimonials.build
	end

    def edit

    end

    def update
      if @testimonial.update(testimonial_params)
        flash[:alert]= "Your testimonial has been updated"
        redirect_to testimonials_path
     else
        render 'edit'
      end
    end

     def destroy
       @testimonial.destroy
       flash[:alert]= "Your testimonial has been deleted"
       redirect_to testimonials_path

    end
	private

	def find_testimonial
        @testimonial =Testimonial.find(params[:id])
	end
	


	def testimonial_params
		params.require(:testimonial).permit(:message)
	end
end
