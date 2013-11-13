class GithubFeed < ActiveRecord::Base

  feed = Feedzirra::Feed.fetch_and_parse("https://github.com/organizations/flatiron-school/mikespangler.private.atom?token=00d44043419043cfec014c990cbb228c")

  # puts feed

  # # feed and entries accessors
  # feed.title          # => "Paul Dix Explains Nothing"
  # feed.url            # => "http://www.pauldix.net"
  # feed.feed_url       # => "http://feeds.feedburner.com/PaulDixExplainsNothing"
  # feed.etag           # => "GunxqnEP4NeYhrqq9TyVKTuDnh0"
  # feed.last_modified  # => Sat Jan 31 17:58:16 -0500 2009 # it's a Time object

  entry = feed.entries.first
  entry.title      # => "Ruby Http Client Library Performance"
  entry.url        # => "http://www.pauldix.net/2009/01/ruby-http-client-library-performance.html"
  entry.author     # => "Paul Dix"
  entry.summary    # => "..."
  entry.content    # => "..."
  puts entry.published  # => Thu Jan 29 17:00:19 UTC 2009 # it's a Time object
  entry.categories # => ["...", "..."]

  updated_feed = Feedzirra::Feed.update(feed)
  if updated_feed # => nil if there is nothing new
    puts updated_feed.new_entries # => [] if nothing new otherwise a collection of feedzirra entries
    puts updated_feed.etag # => same as before if nothing new. although could change with comments added to entries.
    puts updated_feed.last_modified # => same as before if nothing new. although could change with comments added to entries.
  end
  # updating a single feed
end
