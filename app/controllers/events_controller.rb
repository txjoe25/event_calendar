class EventsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
 		
  	@events = {
  		:local =>Event.where(:state => @user.state),
  		:other =>Event.where.not(:state => @user.state)
  		}
  end
  def create
  	event = Event.new(event_params)
  	event.user = current_user
  	  if event.save
	   redirect_to "/events"
	  else
	   puts event.errors.messages
	   redirect_to :back
	  end
  end
  def show
  	@event = Event.find(params[:id])
  	# @user = User.find(params[:id])
  	@comments = @event.comments
  end

  def edit
  	@event = Event.find(params[:id])
  end
  def destroy
  		@event = Event.destroy(params[:id])
		redirect_to "/events"
  end
  private
  def event_params
  params.require(:event).permit(:name,:date,:city,:state)
  end
end
