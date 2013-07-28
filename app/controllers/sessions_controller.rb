class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.find_by_email(params[:session][:email])
			sign_in(user)
			redirect_to decks_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		cookies.delete(:user_id)
		redirect_to root_path
	end
end