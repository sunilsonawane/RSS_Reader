class CreateRssUrls < ActiveRecord::Migration
  def change
    create_table :rss_urls do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
