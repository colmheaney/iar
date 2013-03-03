class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order('published_date DESC')
    @posts = @posts.published if current_user.blank?
    @posts = @posts.by_user_id(params[:user]) if params[:user].present?
    @posts = @posts.by_category_id(params[:cat]) if params[:cat].present?
  end

  def show
    @post = Post.find(params[:id])
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
        redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
        render action: "new"
    end
  end

  def update
    params[:post][:category_ids] ||= []
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    end

    private

      def correct_user
        @post = current_user.posts.find_by_id(params[:id])
        redirect_to root_url if @post.nil?
      end
end
