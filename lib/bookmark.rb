require "pg"

class Bookmark
  attr_reader :name

  def initialize(name = "default name")
    @name = name
  end

  def self.all
    ENV["RACK_ENV"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    conn = PG.connect(dbname: db)
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      bookmark["url"]
    }
  end

  def self.create(url)
    ENV["RACK_ENV"] == "test" ? db = "bookmark_manager_test" : db = "bookmark_manager"
    connection = PG.connect(dbname: db)
    connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end
end
