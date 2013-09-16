class EventsController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
	before_filter :common_content, only: [:index, :new, :create, :edit]
	
	def index
    	@upcoming_events = Event.order('date ASC').where('date >= ?', Date.today).where('news = ?', 0)	
      	@past_events 	 = Event.order('date DESC').where('date < ?', Date.today).where('news = ?', 0)	
      	@news_events	 = Event.by_news #if params[:type].present? 
 	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			flash[:success] = "Event successfully added"
			redirect_to events_path
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
			redirect_to events_path
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
