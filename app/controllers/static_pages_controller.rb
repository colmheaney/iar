class StaticPagesController < ApplicationController
  def home
  	@event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
    @message = Message.new
  end

  def about
 	  @event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
  	@message = Message.new
  end

  def education
 	  @event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
  	@message = Message.new		
  end

  def popup
 	  @event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
  	@message = Message.new
  end

  def community
 	  @event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
    @message = Message.new  
  end

  def aerial
 	  @event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
  	@message = Message.new
  end
  
end
