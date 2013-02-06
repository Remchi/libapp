require 'spec_helper'

describe Book do

  describe "validation" do
    
    it "must have title" do
      book = Book.new
      expect(book.valid?).to be_false
    end

  end

  describe "attributes" do

    let(:book) { Book.new }

    it "has title" do
      book.title = "title"
      expect(book.title).to eq("title")
    end
    it "has pages" do
      book.pages = 123
      expect(book.pages).to eq(123)
    end
    it "has description" do
      book.description = "description"
      expect(book.description).to eq("description")
    end
    it "has author" do
      book.author = "author"
      expect(book.author).to eq("author")
    end

  end

end
