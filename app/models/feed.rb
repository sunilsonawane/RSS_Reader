class Feed

  def self.parse_urls
    rss_urls = RssUrl.all
    feeds = get_feeds_from_cache
    rss_urls.each do |rss_url|
      feeds.merge! get_feeds(rss_url)
    end
    save_feeds_into_cache(feeds)
    feeds
  end

  def self.get_feeds(rss_url)
    rss_url_feeds = {}
    doc = Nokogiri::XML(open(rss_url.url))
    doc.xpath('//item').each do |item|
      rss_url_feeds.merge! xml_to_hash(item)
    end
    rss_url_feeds
  end

  def self.xml_to_hash(item)
    item_hash = item.children.each_with_object(Hash.new) do |e, h|
      h[e.name.to_sym] = e.content
    end
    { item_hash[:guid] => item_hash }
  end

  def self.save_feeds_into_cache(feeds)
    $cache.set('rss_feeds', feeds)
  end

  def self.get_feeds_from_cache
     $cache.get('rss_feeds') || {}
  end

  def self.sort_feeds_by_attrib(feeds, attrb)
    feeds.sort_by{|k, v| DateTime.parse(v[attrb])}.reverse
  end

end
