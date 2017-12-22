@destroy_article_steps

Feature: Article Destroying

  Background:
    Given I am on New article page
    And I fill and submit form on new article page with correct data
    And I am on articles page

  Scenario: user can remove article from articles list
    Given I am on articles page
    When I click destroy button and confirm action
    Then I should not see article on articles list page
