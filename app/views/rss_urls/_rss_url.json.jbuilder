json.extract! rss_url, :id, :url, :created_at, :updated_at
json.url rss_url_url(rss_url, format: :json)