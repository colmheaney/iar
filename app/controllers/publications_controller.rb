class PublicationsController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
	before_filter :common_content, only: [:index, :new, :create, :edit]

    def new
    	@publication = Publication.new
    end

    def edit
		@publication = Publication.find(params[:id])
    end

    def index
  	  #@publications = Publication.paginate(page: params[:page], per_page: 5)
      @magazine_publications = Publication.where('pubtype = ?', 'Magazines')
      @leaflet_publications = Publication.where('pubtype = ?', 'Leaflets')
      @paper_publications = Publication.where('pubtype = ?', 'Papers')          
    end

  	def create
		@publication = Publication.new(params[:publication])
		if @publication.save
			flash[:success] = "Publication successfully added"
			redirect_to publications_path
		else
			render 'new'
		end
	end

	def update
		@publication = Publication.find(params[:id])
		if @publication.update_attributes(params[:publication])
			flash[:success] = "Publication Updated"
			redirect_to publications_path
		else
			render 'edit'
		end
	end

	def destroy
	    Publication.find(params[:id]).destroy
	    flash[:success] = "Publication deleted."
	    redirect_to publications_path				
	end	

	# def download
	# 	@publication = Publication.find(params[:id])		
	# 	uploader = @publication.image
	# 	uploader.retrieve_from_store!(File.basename(uploader.url))
	# 	uploader.cache_stored_file!
		 
	# 	send_file uploader.file.path
	# end

end
