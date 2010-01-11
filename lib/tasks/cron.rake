task :cron => :environment do
  # Fetching rss feeds
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end
