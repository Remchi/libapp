Feature: Create book

  Only authenticated reader can create new books.

  Scenario: Create new book as logged in reader
    Given I am a "john@reader.com" reader
    When I fill the new book form with valid data
    Then the book should be added to database
    And I should see it on library page

  Scenario: Try to create new book with empty title as logged in reader
    Given I am a "john@reader.com" reader
    When I fill the new book form with empty title
    Then the book should not be added to database
    And I should see the new book form with error message

  Scenario: Try to create new book as guest user
    Given I am a guest
    When I go to new book page
    Then I should be redirected to access denied page
