Feature: Display books

  Everybody can view the list of all book and the details of specific book.

  Scenario: Show book information
    Given book "The Hamlet" exists
    When I go to "The Hamlet" book page
    Then I should see "The Hamlet" book details
    And I should see "The Hamlet" book edit link

  Scenario: Try to view details of nonexistent book
    When I go to nonexistent book page
    Then I should be redirected to library page
    And I should see "Book doesn't exist" error message
