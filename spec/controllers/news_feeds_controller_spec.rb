require File.dirname(__FILE__) + '/../spec_helper'
 
describe NewsFeedsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => NewsFeed.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    NewsFeed.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    NewsFeed.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(news_feed_url(assigns[:news_feed]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => NewsFeed.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    NewsFeed.any_instance.stubs(:valid?).returns(false)
    put :update, :id => NewsFeed.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    NewsFeed.any_instance.stubs(:valid?).returns(true)
    put :update, :id => NewsFeed.first
    response.should redirect_to(news_feed_url(assigns[:news_feed]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    news_feed = NewsFeed.first
    delete :destroy, :id => news_feed
    response.should redirect_to(news_feeds_url)
    NewsFeed.exists?(news_feed.id).should be_false
  end
end
