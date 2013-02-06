When /^I fill the new book form with valid data$/ do
  visit new_book_url
  fill_in "book_title", with: "The Hamlet"
  fill_in "book_pages", with: "150"
  fill_in "book_author", with: "William Shakespeare"
  fill_in "book_description", with: "Excellent play!"
  click_button "Create"
end

Then /^the book should be added to database$/ do
  expect(Book.find_by_title("The Hamlet")).not_to be_nil
end

Then /^I should see it on library page$/ do
  expect(page).to have_content("The Hamlet")
end

When /^I fill the new book form with empty title$/ do
  visit new_book_url
  click_button "Create"
end

Then /^the book should not be added to database$/ do
  expect(Book.count).to eq(0)
end

Then /^I should see the new book form with error message$/ do
  expect(page).to have_selector("form#new_book")
  expect(page).to have_selector(".alert-error")
end

Given /^book "(.*?)" exists$/ do |title|
  @book = Book.create(id: 1, title: title)
end

When /^I go to "(.*?)" book page$/ do |title|
  visit book_url(@book)
end

Then /^I should see "(.*?)" book details$/ do |title|
  expect(page).to have_content(title)
end

Then /^I should see "(.*?)" book edit link$/ do |title|
  expect(page).to have_link("Edit", href: edit_book_path(@book))
end

When /^I go to nonexistent book page$/ do
  visit("/books/0")
end

Then /^I should be redirected to library page$/ do
  expect(current_path).to eq(root_path)
end

Then /^I should see "(.*?)" error message$/ do |message|
  expect(page).to have_content(message)
end

When /^I change book title to "(.*?)"$/ do |title|
  visit edit_book_path(@book)
  fill_in "book_title", with: title
  click_button "Update"
end

Then /^book "(.*?)" should not exist in database$/ do |title|
  expect(Book.find_by_title(title)).to be_false
end

Then /^book "(.*?)" should exist in database$/ do |title|
  expect(Book.find_by_title(title)).not_to be_nil
end

Then /^I should see "(.*?)" book on library page$/ do |title|
  expect(page).to have_content(title)
end

When /^I delete it$/ do
  visit edit_book_path(@book)
  click_on "Delete"
end

Then /^I should not see "(.*?)" book on library page$/ do |title|
  expect(page).not_to have_content(title)
end
