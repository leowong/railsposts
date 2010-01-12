# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
NewsFeed.create([{ :url => "http://feeds.feedburner.com/railscasts", :source => "railscasts" },
                 { :url => "http://feeds.feedburner.com/RailsInside", :source => "railsinside" },
                 { :url => "http://feeds.feedburner.com/railstips", :source => "railstips" }])
