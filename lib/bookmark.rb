require "pg"

class Bookmark
  attr_reader :title, :url

  def initialize(title = "default tilte", url = "default url")
    @title = title
    @url = url
  end

  def self.all
    ENV["RACK_ENV"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    conn = PG.connect(dbname: db)
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      Bookmark.new(bookmark["title"], bookmark["url"])
    }
  end

  def self.create(title, url)
    ENV["RACK_ENV"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}')")
  end
end
