@destroy_article_steps

Feature: Article Destroying

  Scenario: user can remove article from articles list
    Given there is an article
    And I am on articles list page
    When I click destroy button and confirm action
    Then I should not see article on articles list page
