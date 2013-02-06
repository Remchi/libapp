Feature: Books Management

  Book must have only one required field - title, and several optional fields: author, pages, description.

  Scenario: Create new book
    When I fill the new book form with valid data
    Then the book should be added to database
    And I should see it on library page

  Scenario: Try to create new book with empty title
    When I fill the new book form with empty title
    Then the book should not be added to database
    And I should see the new book form with error message

  Scenario: Show book information
    Given book "The Hamlet" exists
    When I go to "The Hamlet" book page
    Then I should see "The Hamlet" book details
    And I should see "The Hamlet" book edit link

  Scenario: Try to view details of nonexistent book
    When I go to nonexistent book page
    Then I should be redirected to library page
    And I should see "Book doesn't exist" error message

  Scenario: Edit existent book
    Given book "The Hamlet" exists
    When I change book title to "Romeo and Juliet"
    Then book "The Hamlet" should not exist in database
    And book "Romeo and Juliet" should exist in database
    And I should see "Romeo and Juliet" book on library page
    
  Scenario: Delete book
    Given book "The Hamlet" exists
    When I delete it
    Then book "The Hamlet" should not exist in database
    And I should not see "The Hamlet" book on library page
