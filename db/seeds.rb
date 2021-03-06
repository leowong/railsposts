# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
NewsFeed.create([
  { :source   => "railscasts",
    :homepage => "http://railscasts.com/",
    :url      => "http://feeds.feedburner.com/railscasts" },
  { :source   => "railsinside",
    :homepage => "http://www.railsinside.com/",
    :url      => "http://feeds.feedburner.com/RailsInside" },
  { :source   => "railstips",
    :homepage => "http://railstips.org/",
    :url      => "http://feeds.feedburner.com/railstips" },
  { :source   => "ridingrails",
    :homepage => "http://weblog.rubyonrails.org/",
    :url      => "http://feeds.feedburner.com/RidingRails" },
  { :source   => "buckblog",
    :homepage => "http://weblog.jamisbuck.org/",
    :url      => "http://feeds.feedburner.com/buckblog" },
  { :source   => "nubyonrails",
    :homepage => "http://nubyonrails.com/",
    :url      => "http://feeds.feedburner.com/nubyonrails" }
])
