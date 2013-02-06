require 'spec_helper'

describe "books/edit.html.erb" do

  let(:book) { stub_model(Book, title: "title", author: "author", pages: "123", description: "description") }

  before :each do
    assign(:book, book)
    render
  end

  it "has book title field" do
    expect(rendered).to have_selector("#book_title", type: "text", value: book.title)
  end
  it "has book author field" do
    expect(rendered).to have_selector("#book_author", value: book.author)
  end
  it "has book description field" do
    expect(rendered).to have_selector("#book_description", value: book.description)
  end
  it "has book pages field" do
    expect(rendered).to have_selector("#book_pages", value: book.pages)
  end
  it "has submit button" do
    expect(rendered).to have_selector("input[type='submit']")
  end

  it "has delete book link" do
    expect(rendered).to have_link("Delete")
  end

end
