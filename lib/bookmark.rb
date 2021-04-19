require "pg"

class Bookmark
  attr_reader :name

  def initialize(name = "default name")
    @name = name
  end

  def self.all
    conn = PG.connect(dbname: "bookmark_manager")
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      bookmark["url"]
    }
  end
end
