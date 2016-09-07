class AttendeesController < ApplicationController
	def create
		@attendee = Attendee.create(user: current_user, event: Event.find(params[:event_id]))
		redirect_to "/events/#{params[:event_id]}"
	end
	def destroy
		@attendee = Attendee.destroy(params[:id])
		redirect_to "/events"
	end
end
