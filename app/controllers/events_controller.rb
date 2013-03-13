class EventsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
	
	def index
    	@events = Event.order('date DESC').paginate(page: params[:page], per_page: 5)		
      	@events = @events.by_type(params[:type]) if params[:type].present? 

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

	def destroy
	    Event.find(params[:id]).destroy
	    flash[:success] = "Event deleted."
	    redirect_to events_path				
	end
end
