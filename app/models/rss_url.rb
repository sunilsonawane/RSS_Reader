class RssUrl < ActiveRecord::Base
  validates :url, :url => true
end
