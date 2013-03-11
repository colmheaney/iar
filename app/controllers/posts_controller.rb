class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
    @posts = @posts.published if current_user.blank?
    @posts = @posts.by_user_id(params[:user]) if params[:user].present?
    @posts = @posts.by_category_id(params[:cat]) if params[:cat].present?
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    cat_names = []
    @post.categories.each do |cat|
      cat_names << cat.name
    end
    @related = Post.joins(:categories).where('categories.name' => cat_names)#.reject { |r| r.@post }#.group(:id).reject { |r| r.@post }

  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
        redirect_to post_path(@post), notice: 'Post was successfully created'
    else
        render action: "new"
    end
  end

  def update
    params[:post][:category_ids] ||= []    
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post Updated"
      redirect_to @post
    else
      render 'edit'
    end    
  end

  def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post deleted."
      redirect_to posts_path 
  end

    private

      def correct_user
        @post = current_user.posts.find_by_id(params[:id])
        redirect_to root_url if @post.nil?
      end
end
