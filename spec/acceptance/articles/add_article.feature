@add_article_steps
Feature: Article Adding
  As a user
  I want to add a new article
  So other users can see my article

  Background:
    Given I am on articles page

  Scenario: user can add article with correct data
    When I click New article on articles page
    And I fill and submit form on new article page with correct data
    Then I should see newly created article with correct data on article page
    When I open articles page
    Then I should see newly created article with correct data on articles page

  @p1
  Scenario: user can not add article with blank data
    When I click New article on articles page
    And I fill and submit form on new article page with blank data
    Then I should see following text on articles page:
    """
    2 errors prohibited this article from being saved: Title can't be blank Title is too short (minimum is 5 characters)
    """

  @p1
  Scenario: user can not add article with too short title
    When I click New article on articles page
    And I fill and submit form on new article page with data less than 5 characters in 'Title' field
    Then I should see following text on articles page:
    """
    1 error prohibited this article from being saved: Title is too short (minimum is 5 characters)
    """
