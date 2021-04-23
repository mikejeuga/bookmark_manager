require "pg"

class DatabaseConnection
  def self.setup(db)
    @conn = PG.connect(dbname: db)
  end

  def self.conn
    @conn
  end
end
