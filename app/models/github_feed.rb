class GithubFeed < ActiveRecord::Base

  def self.define_feed
    Feedzirra::Feed.fetch_and_parse("https://github.com/organizations/flatiron-school/mikespangler.private.atom?token=00d44043419043cfec014c990cbb228c")
  end

  def self.get_feed
    feed = define_feed
    feed.entries.take(3)
  end

end

# add to view: <%= GithubFeed.get_feed.title %>




  # puts feed

  # # feed and entries accessors
  # feed.title          # => "Paul Dix Explains Nothing"
  # feed.url            # => "http://www.pauldix.net"
  # feed.feed_url       # => "http://feeds.feedburner.com/PaulDixExplainsNothing"
  # feed.etag           # => "GunxqnEP4NeYhrqq9TyVKTuDnh0"
  # feed.last_modified  # => Sat Jan 31 17:58:16 -0500 2009 # it's a Time object

  
  # entry.title      # => "Ruby Http Client Library Performance"
  # entry.url        # => "http://www.pauldix.net/2009/01/ruby-http-client-library-performance.html"
  # entry.author     # => "Paul Dix"
  # entry.summary    # => "..."
  # entry.content    # => "..."
  # puts entry.published  # => Thu Jan 29 17:00:19 UTC 2009 # it's a Time object
  # entry.categories # => ["...", "..."]
