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
    title = params[:title]
    Bookmark.create(title, url)
    redirect "/bookmarks"
  end

  delete "/delete" do
    id = params[:id]
    Bookmark.delete(id)
    redirect "/bookmarks"
  end

  run if app_file == $0
end
