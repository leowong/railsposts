require File.dirname(__FILE__) + '/../spec_helper'

describe NewsFeed do
  it "should be valid" do
    NewsFeed.new.should be_valid
  end
end
