Feature: Home

  @smoke
  Scenario: user can open articles page via menu
    Given home page of web application
    When I click My Blog on home page
    Then I should be redirected to articles page
