class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment: params[:comment], user: current_user, event: Event.find(params[:event]))
		redirect_to "/events/#{params[:event]}"
	end
end
