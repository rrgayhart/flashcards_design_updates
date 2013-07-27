class DecksController < ApplicationController
	before_filter :authenticate

	def index
		@decks = current_user.decks
	end

	def show
		@deck = current_user.decks.find(params[:id])
		@cards = @deck.cards
	end

	def new
		@deck = current_user.decks.new
	end

	def create
		@deck = current_user.decks.new(params[:deck])
		@deck.save
		redirect_to decks_path
	end

	def edit
		@deck = current_user.decks.find(params[:id])
	end

	def update
		@deck = current_user.decks.find(params[:id])
		@deck.update_attributes(params[:deck])	
		redirect_to @deck
	end

	def destroy
		@deck = current_user.decks.find(params[:id])
		@deck.destroy
		redirect_to decks_path
	end
end