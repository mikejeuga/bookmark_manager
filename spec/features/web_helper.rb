require "pg"
require "./lib/bookmark.rb"

def add_test_bookmarks
  Bookmark.create("http://www.makersacademy.com")
  Bookmark.create("http://askjeeves.com")
  Bookmark.create("http://www.google.com")
end
