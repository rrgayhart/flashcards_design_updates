class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		cookies.signed[:user_id] = user.id
		redirect_to decks_path
	end

	def destroy

	end
end