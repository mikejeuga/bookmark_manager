require "bookmark"
require_relative "./features/web_helper.rb"

describe Bookmark do
  let(:last) { double :bookmarks, id: 16, title: "Last", url: "www.last.com" }

  context "#initialize" do
    it "has a name" do
      b = Bookmark.new(id: 54, title: "Google", url: "http://www.google.com")
      expect(b.title).to eq "Google"
    end
  end

  context "#all" do
    it "should return all the element of an array" do
      add_test_bookmarks
      expect(Bookmark.all[0].title).to eq("Makers")
    end
  end

  context "#create" do
    it "should create a new bookmark into the bookmark manager" do
      title = "Github"
      url = "https://github.com/"
      expect { Bookmark.create(title: title, url: url) }.to change { Bookmark.all.length }.by 1
    end
  end

  context "#delete" do
    it "should delete the bookmark chosen" do
      Bookmark.create(title: last.title, url: last.url)
      Bookmark.delete(id: last.id)
      expect(Bookmark.all).not_to include(last)
    end
  end

  context "#get" do
    it "shoud give a bookmark back to the caller" do
      mm_book = Bookmark.create(title: "MM", url: "www.mm.com")
      expect(Bookmark.get(id: mm_book.id).title).to eq("MM")
    end
  end

  context "#update" do
    it "should update the data in the db and the page." do
      mm_book = Bookmark.create(title: "MM", url: "www.mm.com")
      updated = Bookmark.update(id: mm_book.id, title: "FF", url: "www.ff.com")
      expect(Bookmark.get(id: updated.id).title).to eq("FF")
    end
  end
end
