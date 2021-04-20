require "bookmark"
require_relative "./features/web_helper.rb"

describe Bookmark do
  describe "#initialize" do
    it "has a name" do
      b = Bookmark.new("Google")
      expect(b.name).to eq "Google"
    end
  end

  describe "#all" do
    it "should return all the element of an array" do
      add_test_bookmarks
      expect(Bookmark.all).to include("http://www.makersacademy.com", "http://askjeeves.com", "http://www.google.com")
    end
  end

  describe "#create" do
    it "should create a new bookmark into the bookmark manager" do
      url = "https://github.com/"
      expect { Bookmark.create(url) }.to change { Bookmark.all.length }.by 1
    end
  end
end
