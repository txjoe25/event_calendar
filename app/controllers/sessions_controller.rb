class SessionsController < ApplicationController
  def index
    @states = ["AK","AL","AZ","AR","CA","CO","CT","DE","FL","GA",
          "HI","ID","IL","IN","IA","KS","KY","LA","ME","MD",
          "MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
          "NM","NY","NC","ND","OH","OK","OR","PA","RI","SC",
          "SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
  end
  def create
  	user = User.find_by(:email => params[:email])
  if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to "/events"
  else
   redirect_to :back
  end
 end
   def logout
 	session.destroy
 	redirect_to '/'
 end
end
