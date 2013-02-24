class EventsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create]
	
	def index
		@events = Event.paginate(page: params[:page], per_page: 10)		
	end

	def show
		@event = Event.find(params[:id])		
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			flash[:success] = "Event successfully added"
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:event])
			flash[:success] = "Event Updated"
			redirect_to @event
		else
			render 'edit'
		end
	end

	private

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_path, notice: "You must sign in to view that page."
			end
		end	
end
