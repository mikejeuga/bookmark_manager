require "pg"
require "./lib/bookmark.rb"

def add_test_bookmarks
  Bookmark.create(title: "Makers", url: "http://www.makersacademy.com")
  Bookmark.create(title: "Askjeeves", url: "http://askjeeves.com")
  Bookmark.create(title: "Google", url: "http://www.google.com")
end
