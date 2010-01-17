task :cron => :environment do
  if true
    puts ">>> [#{Time.now.utc.httpdate}] Fetching RSS feeds..."
    NewsFeed.update
    puts "<<< [#{Time.now.utc.httpdate}] Done."
  end

  if true
    puts ">>> [#{start = Time.now.utc.httpdate}] Updating posts weight..."
    Post.update_weight
    puts "<<< [#{Time.now.utc.httpdate}] Done."
  end
end
