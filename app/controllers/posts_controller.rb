class PostsController < ApplicationController
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.search params[:source], params[:page]
  end
  
  def hot
    @posts = Post.hot.paginate :page => params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end

  def hit
    if request.post?
      @post = Post.find(params[:id])
      @post.increase_points_by_one
    end
    head :ok
  end
end
