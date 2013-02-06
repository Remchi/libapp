require 'spec_helper'

describe "books/index.html.erb" do

  it "has a list of books with titles with links to show page" do
    book1 = stub_model(Book, title: "book1", id: 1)
    book2 = stub_model(Book, title: "book2", id: 2)
    books = [book1, book2]
    assign(:books, books)
    render
    expect(rendered).to have_link("book1", href: book_path(book1))
    expect(rendered).to have_link("book2", href: book_path(book2))
  end

end
