require 'spec_helper'

describe "books/show.html.erb" do

  let(:book) { stub_model(Book, title: "book1", author: "author", description: "desc") }
  before :each do
    assign(:book, book)
    render
  end

  it "has title" do
    expect(rendered).to have_content(book.title)
  end
  it "has author" do
    expect(rendered).to have_content(book.author)
  end
  it "has description" do
    expect(rendered).to have_content(book.description)
  end
  it "has edit link" do
    expect(rendered).to have_link("Edit", href: edit_book_path(book))
  end
  it "has cover image" do
    expect(rendered).to have_selector("img#cover")
  end
  it "has delete link" do
    expect(rendered).to have_link("Delete")
  end

end
