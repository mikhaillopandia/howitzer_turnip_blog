@view_article_steps
Feature: Article Viewing
  I want to view article page
  So I can see what article page includes

  @bug
  Scenario: user is viewing article page
    Given there is an article with created by admin user comment to this article
    When I open this article page
    Then I should see correct article data on article page
    And I should see admin user comment on article page with correct comment and commenter data
    And I should see add comment form on article page
    And I should see body field on article page
    And I should see buttons: edit article, destroy comment, create comment on article page
    When I click back to articles link on article page
    Then I should be redirected to article list page
