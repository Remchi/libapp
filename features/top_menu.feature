Feature: Top menu

  On any page user of the application must see the menu with links.
  Guest user sees links to Registration form and Login
  Reader sees his email, Account link and Logout link
  Admin sees the same thing the reader does, but also the link to admin panel.

  Scenario: Guest user
    Given I am a guest
    When I go to home page
    Then I should see guest menu
