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
