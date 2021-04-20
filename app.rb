require "sinatra"
require "sinatra/reloader"
require_relative "./lib/bookmark"
require "pg"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:index)
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post "/create" do
    url = params[:url]
    # connection = PG.connect(dbname: "bookmark_manager_test")
    # connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
    Bookmark.create(url)
    redirect "/bookmarks"
  end

  run if app_file == $0
end
