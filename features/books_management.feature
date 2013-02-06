Feature: Books Management

  Book must have only one required field - title, and several optional fields: author, pages, description.



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
