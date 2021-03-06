@edit_article_steps
Feature: Article Editing
  As user
  I want to edit my article
  So other users can see my edited article

  Background:
    Given I am on New article page
    And I fill and submit form on new article page with correct data
    And I am on articles page

  Scenario: user can edit article with correct data
    When I click edit button on articles page
    And I fill and submit form on edit article page with new correct data
    Then I should see article with new data on article page

  @p1
  Scenario: user can not edit article with blank title
    When I click edit button on articles page
    And I fill and submit form on edit article page with blank data
    Then I should see following text on article page:
    """
    2 errors prohibited this article from being saved: Title can't be blank Title is too short (minimum is 5 characters)
    """

  @p1
  Scenario: user can not edit article with too short title
    When I click edit button on articles page
    And I fill and submit form on edit article page with data less than 5 characters in 'Title' field
    Then I should see following text on article page:
    """
    1 error prohibited this article from being saved: Title is too short (minimum is 5 characters)
    """
