require "pg"

class Bookmark
  attr_reader :title, :url, :id

  def initialize(id, title = "default tilte", url = "default url")
    @id = id
    @title = title
    @url = url
  end

  def self.all
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    conn = PG.connect(dbname: db)
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      Bookmark.new(bookmark["id"], bookmark["title"], bookmark["url"])
    }
  end

  def self.create(title, url)
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}')")
  end

  def self.delete(id)
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    connection.exec("DELETE FROM bookmarks WHERE title = '#{id}'")
  end
end
