Given /^I am a guest$/ do
end

When /^I fill the register form with valid data$/ do
  visit("/register")
  fill_in "reader_email", with: "reader01@mail.com"
  fill_in "reader_password", with: "pass"
  fill_in "reader_password_confirmation", with: "pass"
  click_button "Register"
end

Then /^I should be registered in application$/ do
  expect(Reader.find_by_email("reader01@mail.com")).not_to be_nil
end

When /^I fill the register form with invalid data$/ do
  visit("/register")
  fill_in "reader_email", with: "reader"
  fill_in "reader_password", with: "pass"
  fill_in "reader_password_confirmation", with: "pass"
  click_button "Register"
end

Then /^I should see the resister form again$/ do
  expect(page).to have_selector('form#new_reader')
end

Then /^I should not be registered in application$/ do
  expect(Reader.find_by_email('reader')).to be_nil
end

Then /^I should be logged in$/ do
  expect(page).to have_content("Welcome, reader01@mail.com")
end

When /^I go to home page$/ do
  visit root_url
end

Then /^I should see guest menu$/ do
  expect(page).to have_selector("#top-menu")
  expect(page).to have_link('Register', href: register_path)
end

Given /^I am a "(.*?)" reader$/ do |email|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" reader menu$/ do |email|
  pending # express the regexp above with the code you wish you had
end

Given /^reader with "(.*?)" exists$/ do |email|
  Reader.create( email: email, password: "pass", password_confirmation: "pass" )
end

When /^I fill the login form with valid data for "(.*?)" reader$/ do |email|
  visit("/login")
  fill_in "login_email", with: email
  fill_in "login_password", with: "pass"
  click_button "Login"
end

Then /^I should be logged in as "(.*?)" reader$/ do |email|
  expect(page).to have_content("Welcome, #{email}")
end
