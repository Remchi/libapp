require 'spec_helper'

describe Book do

  it { should belong_to(:reader) }

  describe "#owned_by?" do
    it "returns true if book is created by provided reader" do
      owner = stub_model(Reader)
      book = Book.new( title: "title", reader: owner )
      expect(book.owned_by?(owner)).to be_true
    end
    it "returns false if book is not created by provided reader" do
      owner = stub_model(Reader)
      reader = stub_model(Reader)
      book = Book.new( title: "title", reader: owner )
      expect(book.owned_by?(reader)).to be_false
    end
  end

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
