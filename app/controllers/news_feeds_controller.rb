class NewsFeedsController < ApplicationController
  before_filter :authorize, :except => [:index, :new, :create]

  def index
    @news_feeds = NewsFeed.all
  end
  
  def show
    @news_feed = NewsFeed.find(params[:id])
  end
  
  def new
    @news_feed = NewsFeed.new
  end
  
  def create
    @news_feed = NewsFeed.new(params[:news_feed])
    if @news_feed.save
      flash[:notice] = "Successfully created news feed."
      redirect_to @news_feed
    else
      render :action => 'new'
    end
  end
  
  def edit
    @news_feed = NewsFeed.find(params[:id])
  end
  
  def update
    @news_feed = NewsFeed.find(params[:id])
    if @news_feed.update_attributes(params[:news_feed])
      flash[:notice] = "Successfully updated news feed."
      redirect_to @news_feed
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @news_feed = NewsFeed.find(params[:id])
    @news_feed.destroy
    flash[:notice] = "Successfully destroyed news feed."
    redirect_to news_feeds_url
  end
end
