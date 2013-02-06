require 'spec_helper'

describe "books/new.html.erb" do

  let(:book) {mock_model("Book").as_null_object.as_new_record}

  before :each do
    assign(:book, book)
    render
  end

  it "has book title" do
    expect(rendered).to have_selector("#book_title")
  end
  it "has book author" do
    expect(rendered).to have_selector("#book_author")
  end
  it "has book description" do
    expect(rendered).to have_selector("#book_description")
  end
  it "has book cover" do
    expect(rendered).to have_selector("#book_cover")
  end
  it "has book pages" do
    expect(rendered).to have_selector("#book_pages")
  end
  it "has submit button" do
    expect(rendered).to have_selector("input[type='submit']")
  end

end
