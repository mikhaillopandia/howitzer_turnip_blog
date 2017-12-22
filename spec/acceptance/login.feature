Feature: Log In
  As a user
  I want to use my credentials to login the system
  So I can login the system

  @smoke
  Scenario: user can open articles page via menu
    Given home page of web application
    When I click My Blog on home page
    Then I should be redirected to articles page
