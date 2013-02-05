Feature: Authentication feature

  Scenario: Successfull reader login
    Given I am a guest
    And reader with "bob@reader.com" exists
    When I fill the login form with valid data for "bob@reader.com" reader
    Then I should be logged in as "bob@reader.com" reader

  Scenario: Logout
    Given I am a "reader01@email.com" reader
    When I go to logout page
    Then I should be logged out
