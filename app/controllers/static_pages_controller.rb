class StaticPagesController < ApplicationController
  before_filter :common_content

  def home
  	@event_excerpts = Event.find(:all, :order => "id desc", :limit => 3)
  	@publication = Publication.find_all_by_pubtype("Magazines", :order => "id desc", :limit => 1)#(:all)
  end

  def about
  end

  def education
  end

  def popup
  end

  def community
  end

  def aerial
  end
  
end
