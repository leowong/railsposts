class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
