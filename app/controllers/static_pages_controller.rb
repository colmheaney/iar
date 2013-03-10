class StaticPagesController < ApplicationController
  def home
  	@blog_excerpts = Post.find(:all, :order => "id desc", :limit => 2)
  	@event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find(:all, :order => "id desc", :limit => 1)

  end

  def about
  end

  def contact
  end

  
end
