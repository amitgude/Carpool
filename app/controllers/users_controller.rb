class UsersController < ApplicationController

    def show
     @user= User.find(params[:id])
    end
    
	def upvote
		@user= User.find(params[:id])
		@user.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@user= User.find(params[:id])
		@user.downvote_by current_user
		redirect_to @user
	end

	def message
		reciever = User.find(params[:id])
		sender = User.find(current_user.id)

		sender.send_message(reciever, params[:title], params[:message])
		redirect_to reciever
	end


	def inbox

		@recieved = current_user.received_messages.order("created_at DESC")
		@sent = current_user.sent_messages.order("created_at DESC")
	end

	
end
