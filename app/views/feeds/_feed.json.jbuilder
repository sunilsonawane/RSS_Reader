json.extract! feed, :id, :title, :url, :content, :publish_date, :created_at, :updated_at
json.url feed_url(feed, format: :json)