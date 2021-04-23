require "pg"

class Bookmark
  attr_reader :title, :url, :id

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    conn = PG.connect(dbname: db)
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
    }
  end

  def self.create(title:, url:)
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    new_data = connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: new_data[0]["id"], title: new_data[0]["title"], url: new_data[0]["url"])
  end

  def self.delete(id:)
    ENV["ENVIRONMENT"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end
end
