class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  def create
  	user = User.new(user_params)
	  if user.save
	   session[:user_id] = user.id
	   redirect_to "/events"
	  else
	   puts user.errors.messages
     redirect_to :back
	  end
	 end
   def update
      user = User.find(params[:id])
      user.update(first_name: params[:first_name],last_name: params[:last_name],email: params[:email],city: params[:city],state: params[:state])
      puts user.errors.full_messages
      redirect_to '/events'
      end
  private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email,:city,:state,:password, :password_confirmation)	
  end
end
