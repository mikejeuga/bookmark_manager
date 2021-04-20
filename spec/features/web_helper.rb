require "pg"
require "./lib/bookmark.rb"

def add_test_bookmarks
  Bookmark.create("Makers", "http://www.makersacademy.com")
  Bookmark.create("Askjeeves", "http://askjeeves.com")
  Bookmark.create("Google", "http://www.google.com")
end
