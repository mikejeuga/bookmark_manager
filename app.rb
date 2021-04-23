require "sinatra"
require "sinatra/reloader"
require_relative "./lib/bookmark"
require "pg"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :method_override, true

  get "/" do
    erb(:index)
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post "/bookmarks/create" do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.get(id: params[:id])
    erb(:edit)
  end

  patch "/bookmarks/:id" do
    @bookmark = Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  run if app_file == $0
end
